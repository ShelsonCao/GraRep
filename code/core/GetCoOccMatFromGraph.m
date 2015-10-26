function A_k = GetCoOccMatFromGraph(A, num_nodes, step)

A = ScaleSimMat(A);                         %scale by row
A_k = zeros(num_nodes, num_nodes, step);
A_k(:,:,1) = A;

for i = 2:step
    A_k(:,:,i) = A_k(:,:,i-1)*A;            %A_k(:,:,i) indicates A^k
end

end