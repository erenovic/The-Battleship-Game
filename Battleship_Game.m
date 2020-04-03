%Voluntary Homework #2 by Eren Cetin
%due to 14.12.2017
%Battleship Game

answer= 'y';
while answer=='Y' || answer=='y'
    fclose all;
    clear;
    
    %This part just opens the file.
    dataFile= uigetfile('*.txt','Choose the data file');
    if dataFile==0
        fprintf('No data file chosen.\n');
        return
    end
    
    shipFile= fopen(dataFile,'r');
    if shipFile==-1
        fprintf('There occurred a problem while opening the data file.\n')
        return
    end
    
    %Total layout numbers are found in this part.
    nLayout=0;
    while ~feof(shipFile)
        x=fgetl(shipFile);
        if isempty(x)
            nLayout= nLayout+1;
        end
    end
    nLayout=nLayout+1;
    
    fclose all;
    
    user_layout= randi([1,nLayout]);
    comp_layout= randi([1,nLayout]);
    while user_layout==comp_layout
        user_layout= randi([1,nLayout]);
        comp_layout= randi([1,nLayout]);
    end
    
    %FOR USER'S LAYOUT
    shipFile= fopen(dataFile,'r');
    if shipFile==-1
        fprintf('There occurred a problem while opening the data file.\n')
        return
    end
    
    %The start point must be an empty line if the user layout is not 1.
    startpoint= (user_layout-1)*11;
    if startpoint>1
        for i=1:startpoint
            x= fgetl(shipFile);
        end
    else
    end
    x={'a'};
    usership= {};
    count=1;
    
    %This part is to create a cell array with the all coordinates of
    %ships.
    while ~feof(shipFile) && ~isempty(x)
        x= fgetl(shipFile);
        if isempty(x)
            
        elseif x(1)=='4'
            usership{count}= [x(15:16) '4'];
            count= count+1;
            usership{count}= [x(18:19) '4'];
            count= count+1;
            usership{count}= [x(21:22) '4'];
            count= count+1;
            usership{count}= [x(24:25) '4'];
            count= count+1;
        elseif x(1)=='3'
            usership{count}= [x(15:16) '3'];
            count= count+1;
            usership{count}= [x(18:19) '3'];
            count= count+1;
            usership{count}= [x(21:22) '3'];
            count= count+1;
        elseif x(1)=='2'
            usership{count}= [x(15:16) '2'];
            count= count+1;
            usership{count}= [x(18:19) '2'];
            count= count+1;
        elseif x(1)=='1'
            usership{count}= [x(15:16) '1'];
            count= count+1;
        end
    end
    
    %FOR COMPUTER'S LAYOUT
    %Same of User's Layout's proccedure.
    shipFile= fopen(dataFile,'r');
    if shipFile==-1
        fprintf('There occurred a problem while opening the data file.\n')
        return
    end
    
    startpoint= (comp_layout-1)*11;
    if startpoint>1
        for i=1:startpoint
            x= fgetl(shipFile);
        end
    else
    end
    x= {'a'};
    compship= {};
    count=1;
    while ~feof(shipFile) && ~isempty(x)
        x= fgetl(shipFile);
        if isempty(x)
        elseif x(1)=='4'
            compship{count}= [x(15:16) '4'];
            count= count+1;
            compship{count}= [x(18:19) '4'];
            count= count+1;
            compship{count}= [x(21:22) '4'];
            count= count+1;
            compship{count}= [x(24:25) '4'];
            count= count+1;
        elseif x(1)=='3'
            compship{count}= [x(15:16) '3'];
            count= count+1;
            compship{count}= [x(18:19) '3'];
            count= count+1;
            compship{count}= [x(21:22) '3'];
            count= count+1;
        elseif x(1)=='2'
            compship{count}= [x(15:16) '2'];
            count= count+1;
            compship{count}= [x(18:19) '2'];
            count= count+1;
        elseif x(1)=='1'
            compship{count}= [x(15:16) '1'];
            count= count+1;
        end
    end
    LetterArray= {'A','B','C','D','E','F','G','H','I','J'};
    
    %USER TABLE
    %Prepares the user table before the game starts.
    userTable= repmat(' ',[10 10]);
    for i=1:20
        if usership{i}(1)=='A'
            if usership{i}(3)=='4'
                userTable(1,str2double(usership{i}(2))+1)= '4';
            elseif usership{i}(3)=='3'
                userTable(1,str2double(usership{i}(2))+1)= '3';
            elseif usership{i}(3)=='2'
                userTable(1,str2double(usership{i}(2))+1)= '2';
            elseif usership{i}(3)=='1'
                userTable(1,str2double(usership{i}(2))+1)= '1';
            end
        elseif usership{i}(1)=='B'
            if usership{i}(3)=='4'
                userTable(2,str2double(usership{i}(2))+1)= '4';
            elseif usership{i}(3)=='3'
                userTable(2,str2double(usership{i}(2))+1)= '3';
            elseif usership{i}(3)=='2'
                userTable(2,str2double(usership{i}(2))+1)= '2';
            elseif usership{i}(3)=='1'
                userTable(2,str2double(usership{i}(2))+1)= '1';
            end
        elseif usership{i}(1)=='C'
            if usership{i}(3)=='4'
                userTable(3,str2double(usership{i}(2))+1)= '4';
            elseif usership{i}(3)=='3'
                userTable(3,str2double(usership{i}(2))+1)= '3';
            elseif usership{i}(3)=='2'
                userTable(3,str2double(usership{i}(2))+1)= '2';
            elseif usership{i}(3)=='1'
                userTable(3,str2double(usership{i}(2))+1)= '1';
            end
        elseif usership{i}(1)=='D'
            if usership{i}(3)=='4'
                userTable(4,str2double(usership{i}(2))+1)= '4';
            elseif usership{i}(3)=='3'
                userTable(4,str2double(usership{i}(2))+1)= '3';
            elseif usership{i}(3)=='2'
                userTable(4,str2double(usership{i}(2))+1)= '2';
            elseif usership{i}(3)=='1'
                userTable(4,str2double(usership{i}(2))+1)= '1';
            end
        elseif usership{i}(1)=='E'
            if usership{i}(3)=='4'
                userTable(5,str2double(usership{i}(2))+1)= '4';
            elseif usership{i}(3)=='3'
                userTable(5,str2double(usership{i}(2))+1)= '3';
            elseif usership{i}(3)=='2'
                userTable(5,str2double(usership{i}(2))+1)= '2';
            elseif usership{i}(3)=='1'
                userTable(5,str2double(usership{i}(2))+1)= '1';
            end
        elseif usership{i}(1)=='F'
            if usership{i}(3)=='4'
                userTable(6,str2double(usership{i}(2))+1)= '4';
            elseif usership{i}(3)=='3'
                userTable(6,str2double(usership{i}(2))+1)= '3';
            elseif usership{i}(3)=='2'
                userTable(6,str2double(usership{i}(2))+1)= '2';
            elseif usership{i}(3)=='1'
                userTable(6,str2double(usership{i}(2))+1)= '1';
            end
        elseif usership{i}(1)=='G'
            if usership{i}(3)=='4'
                userTable(7,str2double(usership{i}(2))+1)= '4';
            elseif usership{i}(3)=='3'
                userTable(7,str2double(usership{i}(2))+1)= '3';
            elseif usership{i}(3)=='2'
                userTable(7,str2double(usership{i}(2))+1)= '2';
            elseif usership{i}(3)=='1'
                userTable(7,str2double(usership{i}(2))+1)= '1';
            end
        elseif usership{i}(1)=='H'
            if usership{i}(3)=='4'
                userTable(8,str2double(usership{i}(2))+1)= '4';
            elseif usership{i}(3)=='3'
                userTable(8,str2double(usership{i}(2))+1)= '3';
            elseif usership{i}(3)=='2'
                userTable(8,str2double(usership{i}(2))+1)= '2';
            elseif usership{i}(3)=='1'
                userTable(8,str2double(usership{i}(2))+1)= '1';
            end
        elseif usership{i}(1)=='I'
            if usership{i}(3)=='4'
                userTable(9,str2double(usership{i}(2))+1)= '4';
            elseif usership{i}(3)=='3'
                userTable(9,str2double(usership{i}(2))+1)= '3';
            elseif usership{i}(3)=='2'
                userTable(9,str2double(usership{i}(2))+1)= '2';
            elseif usership{i}(3)=='1'
                userTable(9,str2double(usership{i}(2))+1)= '1';
            end
        elseif usership{i}(1)=='J'
            if usership{i}(3)=='4'
                userTable(10,str2double(usership{i}(2))+1)= '4';
            elseif usership{i}(3)=='3'
                userTable(10,str2double(usership{i}(2))+1)= '3';
            elseif usership{i}(3)=='2'
                userTable(10,str2double(usership{i}(2))+1)= '2';
            elseif usership{i}(3)=='1'
                userTable(10,str2double(usership{i}(2))+1)= '1';
            end
        end
    end
    compTable= repmat(' ',[10 10]);
    
    %PRINTING STARTS AFTER HERE!!!!
    
    %The coordinates that user and comp hits are put into different arrays.
    %Inputs are taken for comp and user.
    userHitit= {};
    compHitit= {};
    userCounter= 0;
    compCounter= 0;
    compLetter= LetterArray{1,randi(numel(LetterArray))};
    compNumber= num2str(randi([1,9]));
    compGuess= [compLetter compNumber];
    userGuess= input('Enter new guess: ','s');
    userHistory{1}= userGuess;
    compHistory{1}= compGuess;
    %n counts the element number of history of guesses. It must be at out
    %of while loop.
    n=1;
    
    %GAME STARTS.
    while numel(compHitit)~=20 && numel(userHitit)~=20
        
        %FOR COMP FLEET
        %Changes the elements of matrix with necessary elements. If flag
        %turns to true, it doesn't change the element to +.
        flag=false;
        for i=1:20
            if userGuess(1)=='A'
                if userGuess== compship{1,i}(1:2)
                    if compship{i}(3)=='4'
                        compTable(1,str2double(userGuess(2))+1)= '4';
                        flag=true;
                    elseif compship{i}(3)=='3'
                        compTable(1,str2double(userGuess(2))+1)= '3';
                        flag=true;
                    elseif compship{i}(3)=='2'
                        compTable(1,str2double(userGuess(2))+1)= '2';
                        flag=true;
                    elseif compship{i}(3)=='1'
                        compTable(1,str2double(userGuess(2))+1)= '1';
                        flag=true;
                    end
                end
                if flag==false;
                    compTable(1,str2double(userGuess(2))+1)= '+';
                end
            elseif userGuess(1)=='B'
                if userGuess== compship{i}(1:2)
                    if compship{i}(3)=='4'
                        compTable(2,str2double(userGuess(2))+1)= '4';
                        flag=true;
                    elseif compship{i}(3)=='3'
                        compTable(2,str2double(userGuess(2))+1)= '3';
                        flag=true;
                    elseif compship{i}(3)=='2'
                        compTable(2,str2double(userGuess(2))+1)= '2';
                        flag=true;
                    elseif compship{i}(3)=='1'
                        compTable(2,str2double(userGuess(2))+1)= '1';
                        flag=true;
                    end
                end
                if flag==false;
                    compTable(2,str2double(userGuess(2))+1)= '+';
                end
            elseif userGuess(1)=='C'
                if userGuess== compship{i}(1:2)
                    if compship{i}(3)=='4'
                        compTable(3,str2double(userGuess(2))+1)= '4';
                        flag=true;
                    elseif compship{i}(3)=='3'
                        compTable(3,str2double(userGuess(2))+1)= '3';
                        flag=true;
                    elseif compship{i}(3)=='2'
                        compTable(3,str2double(userGuess(2))+1)= '2';
                        flag=true;
                    elseif compship{i}(3)=='1'
                        compTable(3,str2double(userGuess(2))+1)= '1';
                        flag=true;
                    end
                end
                if flag==false;
                    compTable(3,str2double(userGuess(2))+1)= '+';
                end
            elseif userGuess(1)=='D'
                if userGuess== compship{i}(1:2)
                    if compship{i}(3)=='4'
                        compTable(4,str2double(userGuess(2))+1)= '4';
                        flag=true;
                    elseif compship{i}(3)=='3'
                        compTable(4,str2double(userGuess(2))+1)= '3';
                        flag=true;
                    elseif compship{i}(3)=='2'
                        compTable(4,str2double(userGuess(2))+1)= '2';
                        flag=true;
                    elseif compship{i}(3)=='1'
                        compTable(4,str2double(userGuess(2))+1)= '1';
                        flag=true;
                    end
                end
                if flag==false;
                    compTable(4,str2double(userGuess(2))+1)= '+';
                end
            elseif userGuess(1)=='E'
                if userGuess== compship{i}(1:2)
                    if compship{i}(3)=='4'
                        compTable(5,str2double(userGuess(2))+1)= '4';
                        flag=true;
                    elseif compship{i}(3)=='3'
                        compTable(5,str2double(userGuess(2))+1)= '3';
                        flag=true;
                    elseif compship{i}(3)=='2'
                        compTable(5,str2double(userGuess(2))+1)= '2';
                        flag=true;
                    elseif compship{i}(3)=='1'
                        compTable(5,str2double(userGuess(2))+1)= '1';
                        flag=true;
                    end
                end
                if flag==false;
                    compTable(5,str2double(userGuess(2))+1)= '+';
                end
            elseif userGuess(1)=='F'
                if userGuess== compship{i}(1:2)
                    if compship{i}(3)=='4'
                        compTable(6,str2double(userGuess(2))+1)= '4';
                        flag=true;
                    elseif compship{i}(3)=='3'
                        compTable(6,str2double(userGuess(2))+1)= '3';
                        flag=true;
                    elseif compship{i}(3)=='2'
                        compTable(6,str2double(userGuess(2))+1)= '2';
                        flag=true;
                    elseif compship{i}(3)=='1'
                        compTable(6,str2double(userGuess(2))+1)= '1';
                        flag=true;
                    end
                end
                if flag==false;
                    compTable(6,str2double(userGuess(2))+1)= '+';
                end
            elseif userGuess(1)=='G'
                if userGuess== compship{i}(1:2)
                    if compship{i}(3)=='4'
                        compTable(7,str2double(userGuess(2))+1)= '4';
                        flag=true;
                    elseif compship{i}(3)=='3'
                        compTable(7,str2double(userGuess(2))+1)= '3';
                        flag=true;
                    elseif compship{i}(3)=='2'
                        compTable(7,str2double(userGuess(2))+1)= '2';
                        flag=true;
                    elseif compship{i}(3)=='1'
                        compTable(7,str2double(userGuess(2))+1)= '1';
                        flag=true;
                    end
                end
                if flag==false;
                    compTable(7,str2double(userGuess(2))+1)= '+';
                end
            elseif userGuess(1)=='H'
                if userGuess== compship{i}(1:2)
                    if compship{i}(3)=='4'
                        compTable(8,str2double(userGuess(2))+1)= '4';
                        flag=true;
                    elseif compship{i}(3)=='3'
                        compTable(8,str2double(userGuess(2))+1)= '3';
                        flag=true;
                    elseif compship{i}(3)=='2'
                        compTable(8,str2double(userGuess(2))+1)= '2';
                        flag=true;
                    elseif compship{i}(3)=='1'
                        compTable(8,str2double(userGuess(2))+1)= '1';
                        flag=true;
                    end
                end
                if flag==false;
                    compTable(8,str2double(userGuess(2))+1)= '+';
                end
            elseif userGuess(1)=='I'
                if userGuess== compship{i}(1:2)
                    if compship{i}(3)=='4'
                        compTable(9,str2double(userGuess(2))+1)= '4';
                        flag=true;
                    elseif compship{i}(3)=='3'
                        compTable(9,str2double(userGuess(2))+1)= '3';
                        flag=true;
                    elseif compship{i}(3)=='2'
                        compTable(9,str2double(userGuess(2))+1)= '2';
                        flag=true;
                    elseif compship{i}(3)=='1'
                        compTable(9,str2double(userGuess(2))+1)= '1';
                        flag=true;
                    end
                end
                if flag==false;
                    compTable(9,str2double(userGuess(2))+1)= '+';
                end
            elseif userGuess(1)=='J'
                if userGuess== compship{i}(1:2)
                    if compship{i}(3)=='4'
                        compTable(10,str2double(userGuess(2))+1)= '4';
                        flag=true;
                    elseif compship{i}(3)=='3'
                        compTable(10,str2double(userGuess(2))+1)= '3';
                        flag=true;
                    elseif compship{i}(3)=='2'
                        compTable(10,str2double(userGuess(2))+1)= '2';
                        flag=true;
                    elseif compship{i}(3)=='1'
                        compTable(10,str2double(userGuess(2))+1)= '1';
                        flag=true;
                    end
                end
                if flag==false;
                    compTable(10,str2double(userGuess(2))+1)= '+';
                end
            end
        end
        
        
        %FOR USER'S FLEET SCREEN
        %Changes the matrix elements with necessary elements. Same
        %procedure as comp's fleet screen.
        flag=false;
        for i=1:20
            if compGuess(1)=='A'
                if strcmp(compGuess,usership{i}(1:2))
                    if usership{i}(3)=='4'
                        userTable(1,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='3'
                        userTable(1,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='2'
                        userTable(1,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='1'
                        userTable(1,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    end
                end
                if flag==false;
                    userTable(1,str2double(compGuess(2))+1)= '+';
                end
            elseif compGuess(1)=='B'
                if strcmp(compGuess,usership{i}(1:2))
                    if usership{i}(3)=='4'
                        userTable(2,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='3'
                        userTable(2,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='2'
                        userTable(2,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='1'
                        userTable(2,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    end
                end
                if flag==false;
                    userTable(2,str2double(compGuess(2))+1)= '+';
                end
            elseif compGuess(1)=='C'
                if strcmp(compGuess,usership{i}(1:2))
                    if usership{i}(3)=='4'
                        userTable(3,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='3'
                        userTable(3,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='2'
                        userTable(3,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='1'
                        userTable(3,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    end
                end
                if flag==false;
                    userTable(3,str2double(compGuess(2))+1)= '+';
                end
            elseif compGuess(1)=='D'
                if strcmp(compGuess,usership{i}(1:2))
                    if usership{i}(3)=='4'
                        userTable(4,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='3'
                        userTable(4,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='2'
                        userTable(4,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='1'
                        userTable(4,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    end
                end
                if flag==false;
                    userTable(4,str2double(compGuess(2))+1)= '+';
                end
            elseif compGuess(1)=='E'
                if strcmp(compGuess,usership{i}(1:2))
                    if usership{i}(3)=='4'
                        userTable(5,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='3'
                        userTable(5,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='2'
                        userTable(5,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='1'
                        userTable(5,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    end
                end
                if flag==false;
                    userTable(5,str2double(compGuess(2))+1)= '+';
                end
            elseif compGuess(1)=='F'
                if strcmp(compGuess,usership{i}(1:2))
                    if usership{i}(3)=='4'
                        userTable(6,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='3'
                        userTable(6,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='2'
                        userTable(6,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='1'
                        userTable(6,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    end
                end
                if flag==false;
                    userTable(6,str2double(compGuess(2))+1)= '+';
                end
            elseif compGuess(1)=='G'
                if strcmp(compGuess,usership{i}(1:2))
                    if usership{i}(3)=='4'
                        userTable(7,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='3'
                        userTable(7,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='2'
                        userTable(7,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='1'
                        userTable(7,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    end
                end
                if flag==false;
                    userTable(7,str2double(compGuess(2))+1)= '+';
                end
            elseif compGuess(1)=='H'
                if strcmp(compGuess,usership{i}(1:2))
                    if usership{i}(3)=='4'
                        userTable(8,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='3'
                        userTable(8,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='2'
                        userTable(8,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='1'
                        userTable(8,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    end
                end
                if flag==false;
                    userTable(8,str2double(compGuess(2))+1)= '+';
                end
            elseif compGuess(1)=='I'
                if strcmp(compGuess,usership{i}(1:2))
                    if usership{i}(3)=='4'
                        userTable(9,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='3'
                        userTable(9,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='2'
                        userTable(9,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='1'
                        userTable(9,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    end
                end
                if flag==false;
                    userTable(9,str2double(compGuess(2))+1)= '+';
                end
            elseif compGuess(1)=='J'
                if strcmp(compGuess,usership{i}(1:2))
                    if usership{i}(3)=='4'
                        userTable(10,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='3'
                        userTable(10,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='2'
                        userTable(10,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    elseif usership{i}(3)=='1'
                        userTable(10,str2double(compGuess(2))+1)= '*';
                        flag=true;
                    end
                end
                if flag==false;
                    userTable(10,str2double(compGuess(2))+1)= '+';
                end
            end
        end
        
        %This part prints the main screen the user sees. Printer function
        %is used.
        clc
        fprintf('       0 1 2 3 4 5 6 7 8 9                    0 1 2 3 4 5 6 7 8 9     \n')
        fprintf('       = = = = = = = = = =                    = = = = = = = = = =     \n')
        disp(printer(userTable,compTable))
        fprintf('       = = = = = = = = = =                    = = = = = = = = = =     \n')
        fprintf('       0 1 2 3 4 5 6 7 8 9                    0 1 2 3 4 5 6 7 8 9     \n')
        fprintf('\n')
        fprintf('     Your last guess was %s.               Computer''s last guess was %s.\n',userGuess,compGuess)
        
        %THIS PART FINDS IF THE USER OR COMPUTER HIT IT.
        %Flags are used to determine if the program should print 'it missed
        %text or not.'
        flagUser= false;
        flagComp= false;
        for i=1:20
            if strcmp(userGuess,compship{i}(1:2))
                if compship{i}(3)== '4'
                    fprintf('     %-38s','A battle ship (4sq) was hit!')
                    userCounter= userCounter+1;
                    userHitit{1,userCounter}= userGuess;
                    flagUser=true;
                elseif compship{i}(3)== '3'
                    fprintf('     %-38s','A cruiser (3sq) was hit!')
                    userCounter= userCounter+1;
                    userHitit{1,userCounter}= userGuess;
                    flagUser=true;
                elseif compship{i}(3)== '2'
                    fprintf('     %-38s','A frigate (2sq) was hit!')
                    userCounter= userCounter+1;
                    userHitit{1,userCounter}= userGuess;
                    flagUser=true;
                elseif compship{i}(3)== '1'
                    fprintf('     %-38s','A minesweeper (1sq) was hit!')
                    userCounter= userCounter+1;
                    userHitit{1,userCounter}= userGuess;
                    flagUser=true;
                end
            end
        end
        if flagUser==false
            fprintf('     %-38s','It missed.')
        end
        for i=1:20
            if strcmp(compGuess,usership{i}(1:2))
                if usership{i}(3)== '4'
                    fprintf('A battle ship (4sq) was hit!\n')
                    compCounter= compCounter+1;
                    compHitit{compCounter}= compGuess;
                    flagComp=true;
                elseif usership{i}(3)== '3'
                    fprintf('A cruiser (3sq) was hit!\n')
                    compCounter= compCounter+1;
                    compHitit{compCounter}= compGuess;
                    flagComp=true;
                elseif usership{i}(3)== '2'
                    fprintf('A frigate (2sq) was hit!\n')
                    compCounter= compCounter+1;
                    compHitit{compCounter}= compGuess;
                    flagComp=true;
                elseif usership{i}(3)== '1'
                    fprintf('A minesweeper (1sq) was hit!\n')
                    compCounter= compCounter+1;
                    compHitit{compCounter}= compGuess;
                    flagComp=true;
                else
                end
            end
        end
        if flagComp==false
            fprintf('%s\n','It missed.')
        end
        fprintf('\n')
        
        %THIS PART IS TO TAKE A NEW GUESS.
        if numel(compHitit)~=20 && numel(userHitit)~=20
            n= n+1;
            compLetter= LetterArray{1,randi(numel(LetterArray))};
            compNumber= num2str(randi([1,9]));
            compGuess= [compLetter compNumber];
            userGuess= input('     Enter new guess: ','s');
            
            %If i=2 the program controls if the guess and previous guesses
            %are same. The value of i changes to 2 again if the guess is
            %wrong and wants a new guess. Since i=2 again it checks the new
            %guess too.
            i=2;
            while i<= n
                if strcmp(userGuess,userHistory{i-1})
                    fprintf('     You guessed this coordinate before, try another.\n')
                    userGuess= input('     Enter new guess: ','s');
                    i=2;
                else
                    i= i+1;
                end
            end
            i=2;
            while i<= n
                if strcmp(compGuess,compHistory{i-1})
                    compLetter= LetterArray{1,randi(numel(LetterArray))};
                    compNumber= num2str(randi([1,9]));
                    compGuess= [compLetter compNumber];
                    i=2;
                else
                    i=i+1;
                end
            end
            userHistory{n}= userGuess;
            compHistory{n}= compGuess;
            
        elseif numel(compHitit)==20 && numel(userHitit)~=20
            fprintf('     Computer won the game :(\n')
        elseif numel(userHitit)==20 && numel(compHitit)~=20
            fprintf('     You won the game!\n')
        elseif numel(compHitit)==20 && numel(userHitit)==20
            fprintf('     It is a draw.\n')
        end
    end
    answer= input('     Want to play again (Y/N)? ','s');
end
fprintf('\n')
fclose all;
