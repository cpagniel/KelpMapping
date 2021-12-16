key = get(MAIN.hf1, 'CurrentKey');

if strcmp(key,'s') % Save DATA
    savedata;
    disp('Data have been saved.')
elseif strcmp(key,'c') % Save DATA and Select Next Image
    savedatanext;
    disp('Data have been saved.')
elseif strcmp(key,'l') % Save DATA and Load Next Image
    savedataload;
    disp('Data has been saved.')
elseif strcmp(key,'q') % Quit
    delete(MAIN.hf1);
elseif strcmp(key,'m') % Macrocystis pyrifera
    PARAMS.icur = 1;
    skey;
elseif strcmp(key,'p') % Pelagophycus porra
    PARAMS.icur = 2;
    skey;
elseif strcmp(key,'u') % Understory guilds
    PARAMS.icur = 3;
    skey;
elseif strcmp(key,'e') % Egregia menziesii
    PARAMS.icur = 4;
    skey;
end
