function dist = dist_metric(a,b)

%m_a = mean(mean(a));
%m_b = mean(mean(b));

%a_norm = a - m_a;
%b_norm = b - m_b;

%numerator = sum(sum((a_norm) .* (b_norm)));
%denominator = sqrt(sum(sum(a_norm.^ 2)) .* sum(sum(b_norm .^2)));


%x = a - b;
%dist = sum(sum( x .^ 2));



%dist = numerator/denominator;
dist = mean(sum( (a-b).^2 ));
%dist = mean(dot( double(a)./sqrt(sum(a.*a)), double(a)./sqrt(sum(b.*b)) ));

end
