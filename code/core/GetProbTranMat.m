function probTranMat = GetProbTranMat(Ak)

[p, q] = size(Ak);
assert(p==q, 'M must be a square matrix!');

%for more details, plz see our paper
probTranMat = log(Ak ./ repmat(sum(Ak), p, 1)) - log(1/p);

probTranMat(probTranMat<0)=0;                   %positive
IdxNan = isnan(probTranMat);
probTranMat(IdxNan) = 0;

end