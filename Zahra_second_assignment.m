%%%%%%(Download from Blackboard the data %% HandwrittedDigitsmat, containing the data
%matrix X of size 256  1 707 containing pixel images of the handwritten digits, and the
%label vector I of length 1 707 containing numbers from 0 to 9, indicating the digits that
%the corresponding images represent.



load('HandwrittenDigits.mat')


for i= [0,1,3,7]
    %find the asked digits in the label vector I
    indexes = find (I==i);
    % extracts the images corresponding to the current digit from X using
    % indexes
    images = X(:,indexes);
    p = size (images,2);
    %compute the mean
    row_means= 1/p*sum(images,2);
    %center the image by subtracting the maan of each image from the image
    images_centered = images - row_means*ones (1,p);
    

    [U,D,V ]=svd(images_centered);

    samples = images_centered(:,1:5);

    %select 5 samples from the centered images as samples for approximation
    j = 1; 
    % loop for sample size till it is equal to samples 
    while j<=5
        % initializes a variable `loc` to 1, which is used to keep
        % track of the location in the subplot grid
        loc=1;
        samp_j=samples(:,j);
 %  select the `j`-th sample for approximation
        figure()
        for k = 5:5:25
            Uk= U(:,1:k);
            %extract the first pc from matrix U
            Zk = Uk' *samp_j;5;
            %computes the coefficients (`Zk`) of the linear combination of
            % principal components for the current sample image.
            Approx = Uk*Zk ;
            %computes the approximation of the sample image using the 
            % selected principal components and their coefficients.
            subplot(2,5,loc)
            imagesc(reshape(Approx(:,1),16,16)')
            %This line visualizes the approximation image by reshaping the
            % approximation vector into a 16x16 image grid and displaying it.
            colormap("gray")
            axis ('square')
            axis ("off")


            subplot (2,5,loc+5)
            imagesc(reshape(samp_j - Approx(:,1),16,16)')
            colormap("gray")
            axis ('square')
            axis("off")
            loc = loc +1;

        end
        j=j+5;
    end
end


  load('HandwrittenDigits.mat')

for i = [0,1,3,7]
    indexes = find(I == i);
    images = X(:,indexes);
    % perform PCA for every digit of the four
    p = size(images,2);
    row_means = 1/p*sum(images,2);
    images_centered = images - row_means*ones(1,p);
    % Compute the SVD
    [U,D,V] = svd(images_centered);
    % Select the 5 samples
    samples = images_centered(:,1:5);
    norm_res = zeros([5, 5]); % zero matrix
for k = 5:5:25
   Uk = U(:, 1:k); % first k feature vectors
   Zk = Uk'  * images_centered;
   Approx = Uk * Zk;


   for ind = 1:5 
   norm_res(ind,(k/5)) = norm(samples(:,ind) - Approx(:,ind));
    end
end

figure()
vec_k = 5:5:25; % to be displayed on x-axis

   plot(vec_k,(norm_res)' , "Marker","*","MarkerSize",8)
   set(gca, 'FontSize' ,18)
   xlim([4 26])
   ylim([0 7])
   title('Residuals for digit'  ,num2str(i)')
   xlabel( 'Values of k' )
   ylabel('Norms of residuals' )
   legend('Sample 1' ,  'Sample 2' ,'Sample 3', ...
   'Sample 4' , 'Sample 5' )  

end         

         
        
                
       



