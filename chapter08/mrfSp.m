function m = mrfSp(mrf, f)
% sum product belief propagation on Markov random field (undirected graphical model)
% support parallel schedule and serial schdule
% A: affinity matrix (sparse) of a MRF graph, where a_ij=A(i,j) is parameter
% f: a function to compute pairwise relation f(x_i,x_j,a_ij), e.g. f(x,y)=axy


epoch = 100;
llh = zeros(epoch+1);
tol = 1e-4;
m = init(mrf);
for t = 1:epoch
    for i = 1:mrf.size()
        idx = mrf.neighbour(i);
        
        m(i) = mrf.f(i,idx);
    end
    llh(t+1)=0;
    if llh(t+1)-llh(t) < tol; break; end
end


function m = init(mrf)
m = zeros(mrf.size());




