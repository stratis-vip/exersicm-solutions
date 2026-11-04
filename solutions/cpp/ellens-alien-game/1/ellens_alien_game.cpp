namespace targets {
// TODO: Insert the code for the alien class here
class Alien {
    public:
    Alien(const int x, const int y) :x_coordinate(x), y_coordinate(y) {};
    int get_health() const {return health;}

    int x_coordinate{0};
    int y_coordinate{0};
    bool hit(){
        if (health > 0)
            health--;
        return true;
    }
    bool is_alive(){
        return health > 0;
    }

    bool teleport(int x_new, int y_new){
        x_coordinate= x_new;
        y_coordinate= y_new;
        return true;
    }

    bool collision_detection(const Alien &al){
        if (x_coordinate == al.x_coordinate ||
           y_coordinate == al.y_coordinate ){
            return true;
        }
        return false;
    }
    
    private:
    
    int health{3};
};
}  // namespace targets
