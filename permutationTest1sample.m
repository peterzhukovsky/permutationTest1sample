function [p]=permutationTest1sample(inputdata, nperm, showfigure)
% one sample permutation test:
%please provide input data (inputdata, 1-D vector) and 
%number of permutations (nperm) 
%and optionally set showfigure flag to 1 to get a visual of the
%distribtuion of random data means from each permutation + real mean

l=length(inputdata);
real_mean=mean(inputdata);
rand_mean=zeros(1,l);

for i=1:nperm
    randids = datasample([-1 1],l ,'Replace',true);
    randdata=randids'.*inputdata;
    rand_mean(i)=mean(randdata);
end

p=(sum(rand_mean >= abs(real_mean)) + sum(rand_mean <= -abs(real_mean)))/nperm;
  
 if ~exist('showfigure','var')
     % third parameter does not exist, so default it to something
      showfigure=0;
 end
 
 if showfigure==1
  figure; SP=real_mean; line([SP SP], [0 nperm/10]);hold on; histogram(rand_mean);  
 end
end
