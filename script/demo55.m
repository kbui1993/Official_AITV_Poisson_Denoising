%% Set parameter and peak
delta = 1e-3; %penalty parameter for ADMM
peak = 55;

%% river

% read image
I = imread('Images/river.jpg');
I = double(I);
rng(1234);

% Set image peak and add Poisson noise
Q = max(max(I)) /peak;
I = I / Q;
I(I == 0) = min(min(I(I > 0)));
u0 = imnoise(uint8(I),'poisson');
u0 = double(u0);

% compute psnr/ssim
noisy_psnr = psnr(u0*Q, I*Q, 255);
noisy_ssim = ssim(uint8(u0*Q), uint8(I*Q));

% denoise by Poisson AITV and compute metrics
lambda = 8;
alpha = 0.1;
uAITV = Poisson_L1mL2(u0, lambda, alpha, delta);
aitv_psnr = psnr(uAITV*Q, I*Q, 255);
aitv_ssim = ssim(uint8(uAITV*Q), uint8(I*Q));

% plot figure
figure;
subplot(1,3,1); imagesc(I); axis off; axis image; colormap gray; title('Original');
subplot(1,3,2); imagesc(u0); axis off; axis image; colormap gray; title(sprintf('Noisy\n PSNR:%.2f/SSIM:%.2f',noisy_psnr, noisy_ssim))
subplot(1,3,3); imagesc(uAITV); axis off; axis image; colormap gray; title(sprintf('AITV\n PSNR:%.2f/SSIM:%.2f',aitv_psnr, aitv_ssim))

%% butterfly

% read image
I = imread('Images/butterfly.jpg');
I = double(I);
rng(1234);

% Set image peak and add Poisson noise
Q = max(max(I)) /peak;
I = I / Q;
I(I == 0) = min(min(I(I > 0)));
u0 = imnoise(uint8(I),'poisson');
u0 = double(u0);

% compute psnr/ssim
noisy_psnr = psnr(u0*Q, I*Q, 255);
noisy_ssim = ssim(uint8(u0*Q), uint8(I*Q));

% denoise by Poisson AITV and compute metrics
lambda = 10;
alpha = 0.1;
uAITV = Poisson_L1mL2(u0, lambda, alpha, delta);
aitv_psnr = psnr(uAITV*Q, I*Q, 255);
aitv_ssim = ssim(uint8(uAITV*Q), uint8(I*Q));

% plot figure
figure;
subplot(1,3,1); imagesc(I); axis off; axis image; colormap gray; title('Original');
subplot(1,3,2); imagesc(u0); axis off; axis image; colormap gray; title(sprintf('Noisy\n PSNR:%.2f/SSIM:%.2f',noisy_psnr, noisy_ssim))
subplot(1,3,3); imagesc(uAITV); axis off; axis image; colormap gray; title(sprintf('AITV\n PSNR:%.2f/SSIM:%.2f',aitv_psnr, aitv_ssim))

%% starfish

% read image
I = imread('Images/starfish.jpg');
I = double(I);
rng(1234);

% Set image peak and add Poisson noise
Q = max(max(I)) /peak;
I = I / Q;
I(I == 0) = min(min(I(I > 0)));
u0 = imnoise(uint8(I),'poisson');
u0 = double(u0);

% compute psnr/ssim
noisy_psnr = psnr(u0*Q, I*Q, 255);
noisy_ssim = ssim(uint8(u0*Q), uint8(I*Q));

% denoise by Poisson AITV and compute metrics
lambda = 10;
alpha = 0.1;
uAITV = Poisson_L1mL2(u0, lambda, alpha, delta);
aitv_psnr = psnr(uAITV*Q, I*Q, 255);
aitv_ssim = ssim(uint8(uAITV*Q), uint8(I*Q));

% plot figure
figure;
subplot(1,3,1); imagesc(I); axis off; axis image; colormap gray; title('Original');
subplot(1,3,2); imagesc(u0); axis off; axis image; colormap gray; title(sprintf('Noisy\n PSNR:%.2f/SSIM:%.2f',noisy_psnr, noisy_ssim))
subplot(1,3,3); imagesc(uAITV); axis off; axis image; colormap gray; title(sprintf('AITV\n PSNR:%.2f/SSIM:%.2f',aitv_psnr, aitv_ssim))

%% penguin

% read image
I = imread('Images/penguin.jpg');
I = double(I);
rng(1234);

% Set image peak and add Poisson noise
Q = max(max(I)) /peak;
I = I / Q;
I(I == 0) = min(min(I(I > 0)));
u0 = imnoise(uint8(I),'poisson');
u0 = double(u0);

% compute psnr/ssim
noisy_psnr = psnr(u0*Q, I*Q, 255);
noisy_ssim = ssim(uint8(u0*Q), uint8(I*Q));

% denoise by Poisson AITV and compute metrics
lambda = 5;
alpha = 0.1;
uAITV = Poisson_L1mL2(u0, lambda, alpha, delta);
aitv_psnr = psnr(uAITV*Q, I*Q, 255);
aitv_ssim = ssim(uint8(uAITV*Q), uint8(I*Q));

% plot figure
figure;
subplot(1,3,1); imagesc(I); axis off; axis image; colormap gray; title('Original');
subplot(1,3,2); imagesc(u0); axis off; axis image; colormap gray; title(sprintf('Noisy\n PSNR:%.2f/SSIM:%.2f',noisy_psnr, noisy_ssim))
subplot(1,3,3); imagesc(uAITV); axis off; axis image; colormap gray; title(sprintf('AITV\n PSNR:%.2f/SSIM:%.2f',aitv_psnr, aitv_ssim))

%% boat

% read image
I = imread('Images/boat.jpg');
I = double(I);
rng(1234);

% Set image peak and add Poisson noise
Q = max(max(I)) /peak;
I = I / Q;
I(I == 0) = min(min(I(I > 0)));
u0 = imnoise(uint8(I),'poisson');
u0 = double(u0);

% compute psnr/ssim
noisy_psnr = psnr(u0*Q, I*Q, 255);
noisy_ssim = ssim(uint8(u0*Q), uint8(I*Q));

% denoise by Poisson AITV and compute metrics
lambda = 8;
alpha = 0.4;
uAITV = Poisson_L1mL2(u0, lambda, alpha, delta);
aitv_psnr = psnr(uAITV*Q, I*Q, 255);
aitv_ssim = ssim(uint8(uAITV*Q), uint8(I*Q));

% plot figure
figure;
subplot(1,3,1); imagesc(I); axis off; axis image; colormap gray; title('Original');
subplot(1,3,2); imagesc(u0); axis off; axis image; colormap gray; title(sprintf('Noisy\n PSNR:%.2f/SSIM:%.2f',noisy_psnr, noisy_ssim))
subplot(1,3,3); imagesc(uAITV); axis off; axis image; colormap gray; title(sprintf('AITV\n PSNR:%.2f/SSIM:%.2f',aitv_psnr, aitv_ssim))
