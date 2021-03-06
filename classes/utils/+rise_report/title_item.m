function b=title_item(type,title,numbering,tableOfContentsTitle)
% Internal Function -- Not intended to be used by users
%

if nargin<4
    tableOfContentsTitle='';
if nargin<3
    numbering=true;
end
end
if numbering
    number_='';
else
    number_='*';
end

b={};
if ~isempty(title)
    toc_title=tableOfContentsTitle;
    if ~isempty(toc_title)
        toc_title=['[',toc_title,']'];
    end
    b={['\',type,number_,toc_title,'{',title,'}']};
end

end