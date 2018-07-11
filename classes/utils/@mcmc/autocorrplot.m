function hdl=autocorrplot(obj,pname,chain_id,order)

% autocorrplot -- plots autocorrelations of a given parameter
%
% ::
%
%    hdl=autocorrplot(obj,pname)
%    hdl=autocorrplot(obj,pname,chain_id)
%    hdl=autocorrplot(obj,pname,chain_id,order)
%
% Args:
%
%    - **obj** [mcmc object]: mcmc object 
%
%    - **pname** [string]: parameter name 
%
%    - **chain_id** [integer|{[]}]: choice of chain for which to plot the
%      autocorrelation. If empty, all chains are used. 
%
%    - **order** [integer|{40}]: maximum order of the autocorrelation 
%
% Returns:
%    :
%
%    - **hdl** [integer]: handle to the plot
%

if nargin<4
    
    order=[];
    
    if nargin<3
        
        chain_id=[];
        
    end
    
end

if isempty(order)
    
    order=40;
    
end

x=load_draws(obj,pname,chain_id);

nc=size(x,1);

autocorr=zeros(nc,order+1);

for io=1:order+1
    
    ii=io-1;
    
    for ic=1:nc
        
        xx=x(ic,ii+1:end).';
        
        yy=x(ic,1:end-ii).';
        
        autocorr(ic,io)=corr(xx,yy);
        
    end
    
end

start_at=2;

select=start_at:order;

if ic>1
    
    select=utils.plot.locate_ticks(order,5,start_at);
    
end

autocorr=autocorr(:,select);
    
hdl0=bar(select(:),autocorr.');

% hdl0=plot(autocorr(:,2:end).');

title(pname)

axis tight

if nargout
    
    hdl=hdl0;
    
end

end

