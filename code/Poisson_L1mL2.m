%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This function solves the following Poisson denoising
%model with AITV regularization:
%
%   min \lambda \langle u - f log u \rangle +
%   \|\nabla u\|_1 - \alpha \|\nabla u\|_{2,1}
%
%Input:
%   f: image
%   lambda: weighing parameter for fidelity term
%   alpha: sparsity parameter for L1-\alpha L2 term of gradient
%   delta: penalty parameter for ADMM
%
%Output:
%   u: denoised image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [u]= Poisson_L1mL2(f, lambda, alpha, delta)
    
    %penalty parameter multiplier
    rho = 1.75;
    
    %obtain dimension of image
    [rows,cols] = size(f);
    
    %preintialize variable to store past u
    u0 = zeros(rows,cols);
    
    %preinitialize u
    u= u0;

    %preinitialize v
    v=u0;
    
    %preinitialize w variables
    wx = u0;
    wy = u0;
    
    %preinitialize dual variable
    z = v;
    zx = u0;
    zy = u0;
    
    %build kernel: use the fft algorithm (5-pt stencil)
    uker = zeros(rows,cols);
    uker(1,1) = 4;uker(1,2)=-1;uker(2,1)=-1;uker(rows,1)=-1;uker(1,cols)=-1;
    
    for i=1:300


        %store past u
        u0 = u;
        
        %left-hand side of optimality eqn of u
        new_uker = delta+delta*fft2(uker);
        
        %right-hand side of optimality eqn of u
        rhs = delta*v-z+delta*Dxt(wx)-Dxt(zx)+delta*Dyt(wy)-Dyt(zy);
        
        %solve u-subproblem
        u = ifft2(fft2(rhs)./new_uker);
        
        %compute relative err
        err=norm(u-u0,'fro')/norm(u, 'fro');

        if mod(i,10)==0
            disp(['iterations: ' num2str(i) '!  ' 'error is:   ' num2str(err)]);
        end
        
        % check the stopping criterion
        if err<10^(-5)
            break;
        end

        %solve v-subproblem
        v = (sqrt((lambda-z-delta*u).^2+4*delta*lambda*f)-(lambda-z-delta*u))/(2*delta);

        %solve w-subproblem
        temp1 = Dx(u)+zx/delta;
        temp2 = Dy(u)+zy/delta;
        
        temp1 = reshape(temp1, rows*cols,1);
        temp2 = reshape(temp2, rows*cols,1);
        
        temp = [temp1, temp2];
        temp = shrinkL12(temp,1/delta, alpha);
        wx = temp(:,1);
        wy = temp(:,2);
        wx = reshape(wx, rows,cols);
        wy = reshape(wy, rows,cols);
        
        %update dual variables
        zx = zx+delta*(Dx(u)-wx);
        zy = zy+delta*(Dy(u)-wy);
        z = z+(delta)*(u-v);
        
        %update ADMM penalty parameter
        delta = delta*rho;
    end


end


    