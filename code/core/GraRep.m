function RepMat = GraRep(adjMat, Kstep, dim)

%%----------------------------GraRep Algorithm---------------------------%%

%Load Adjacent Matrix
[num_nodes, q] = size(adjMat);

%Generate k-step Co-occurrence Matrix from Graph
A_k = GetCoOccMatFromGraph(adjMat, num_nodes, Kstep);

%Calculate Probability Transition Matrix and SVD
RepMat = zeros(num_nodes, Kstep*dim);
for i = 1:Kstep
    disp(['run the ', num2str(i), ' times...']);
    probTranMat = GetProbTranMat(A_k(:,:,i));
    Rk = GetRepUseSVD(probTranMat, dim, 0.5);              %defalut value 0.5
    Rk = Rk./ ( repmat( sqrt(sum(Rk.^(2), 2)), 1, dim) );  %scale by l2 norm
    RepMat(:, 1+dim*(i-1):dim*i) = Rk;                     %concatenation
end

RepMat(isnan(RepMat)==1) = 1;
end