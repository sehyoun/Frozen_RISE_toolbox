function m=allmean(this)
% Compute all different type of means for the time series variables
%
% ::
%
%    m = allmean(db);
%
% Args:
%    db (ts object): the times series object to compute the mean of
%
% Returns:
%    :
%    - m (cell): Cell containing
%
%       - 1st column: strings denoting the type of mean (Harmonic, Geometric, Arithmetic, Quadratic)
%       - 1st row: variable names
%       - otherwise: mean value corresponding to the variable and mean concept.
%

vnames=this.varnames;

this=this.data;

if size(this,3)>1
    
    error([mfilename,':: this operation is only defined for databases with one page'])

end

n=size(this,2);

m=cell(5,n+1);

m(2:end,1)={'Harmonic','Geometric','Arithmetic','Quadratic'};

if all(~cellfun(@isempty,vnames))
    
    m(1,2:end)=vnames;
    
end

r=[-1,0,1,2]+eps;

for ii=1:n
    
    dd=this(:,ii);
    
    dd=dd(~isnan(dd));
    
    if isempty(dd)
        
        error([mfilename,':: no valid observations to compute the mean in column ',int2str(ii)])
    
    end
    
    nd=numel(dd);
    
    for jj=1:4
        
        m{jj+1,ii+1}=(sum(dd.^r(jj))/nd)^(1/r(jj));
        
    end
    
end

end
