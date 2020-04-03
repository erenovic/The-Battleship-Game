%Voluntary Homework #2 by Eren Cetin due to 14.12.2017
%The function just creates the wanted table using the real coordinates of
%computer's fleet and user's fleet.
function spacedtable= printer(userTable,compTable)



left= ['  A>';'  B>';'  C>';'  D>';'  E>';'  F>';'  G>';'  H>';'  I>';'  J>'];
right= [' <A';' <B';' <C';' <D';' <E';' <F';' <G';' <H';' <I';' <J'];
spacemiddle= ['            ';'            ';'            ';'            ';'            ';'            ';...
'            ';'            ';'            ';'            '];
spacebeginningend= ['  ';'  ';'  ';'  ';'  ';'  ';'  ';'  ';'  ';'  '];
spacedUsertable= zeros(10,20);
spacedComptable= zeros(10,20);

%SHAPING TABLES
for i=1:10
    for j=1:10
        spacedUsertable(i,2*j-1)=' ';
        spacedUsertable(i,2*j)= userTable(i,j);
    end
end
for i=1:10
    for j=1:10
        spacedComptable(i,2*j-1)=' ';
        spacedComptable(i,2*j)= compTable(i,j);
    end
end
spacedtable= [spacebeginningend left spacedComptable right spacemiddle left spacedUsertable right spacebeginningend];


