namespace hellmath {

enum class AccountStatus{
    troll, guest, user, mod
};

enum class Action {
    read, write, remove
};
auto guest = AccountStatus::guest;
auto troll = AccountStatus::troll;
auto mod = AccountStatus::mod;
        
bool display_post(AccountStatus poster, AccountStatus viewer){
 if (poster == troll)
    return poster == viewer;
 return true;
}

bool permission_check(Action action, AccountStatus status){
    switch (action){
        case Action::read: return true;
        case Action::write: return status != guest;
        case Action::remove: return status == mod;
    } 
}

bool valid_player_combination(AccountStatus a, AccountStatus b){
    if (a == guest || b == guest) {
        return false;
    }
    
    if (a == troll || b == troll) {
        return a == b; 
    }
    
    return true;
}
    
bool has_priority(AccountStatus a, AccountStatus b){
     return a > b;
}
}  // namespace hellmath
