function x = shrinkL12(y,lambda,alpha)
    %this function applies the proximal operator of L1-alpha L2 to each
    %row vector
    
    %initialize solution as zero vector
    x = zeros(size(y));
    
    %obtain the indices of the max entries of each row vector
    [max_y, idx_y] = max(abs(y'));
    max_y = max_y';
    idx_y = idx_y';
    new_idx_y = sub2ind(size(y), (1:size(y,1))',idx_y);
    
    %compute new row vectors when max value of each row vector is greater
    %than lambda
    case1_idx = max_y > lambda;
    
    case1_result = max(abs(y(case1_idx,:))-lambda,0).*sign(y(case1_idx,:));
    norm_case1_result = sqrt(sum(case1_result.^2,2));
    x(case1_idx,:) =((norm_case1_result+alpha*lambda)./norm_case1_result).*case1_result;
    
    %compute one-sparse vector when max value of each row vector is less
    %than or equal to lambda and above (1-alpha)*lambda
    case2_idx = logical((max_y<=lambda).*(max_y>=(1-alpha)*lambda));
    
    x(new_idx_y(case2_idx)) = (max_y(case2_idx)+(alpha-1)*lambda).*sign(y(new_idx_y(case2_idx)));
    
end