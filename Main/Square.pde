class Square{
    Point center;
    int depth;
    float size;
    ArrayList<Square> squares;

    Square(Point _c){
        this.center = _c;

        this.depth = 0;
        this.size = 0.9*width / pow(2, this.depth);
        this.squares = new ArrayList<Square>();
    }
    Square(Point _c, int _d){
        this.center = _c;
        this.depth = _d;

        this.size = 0.9*width / pow(2, this.depth);
        this.squares = new ArrayList<Square>();
    }

    boolean contains(){
        if(mouseX <= this.center.x + this.size/2 && mouseX >= this.center.x - this.size/2
            && mouseY <= this.center.y + this.size/2 && mouseY >= this.center.y - this.size/2)
            return true;
        return false;
    }
    void display(){
        if(this.contains()){
            if(this.depth < MAXDEPTH)
                this.update();
            else if(this.depth == MAXDEPTH){
                fill(255, 255, 255, 255);
                draw_square(this.center, this.size);
            }
        } else {
            fill(map(this.depth, 0, MAXDEPTH, 0, 255), 200, 200, 255);
            draw_square(this.center, this.size);
        }
        for(Square square : this.squares){
            square.display();
        }
    }
    void update(){
        this.squares.clear();

        this.squares.add(new Square(new Point(this.center.x - this.size/4, this.center.y - this.size/4), this.depth + 1));
        this.squares.add(new Square(new Point(this.center.x + this.size/4, this.center.y - this.size/4), this.depth + 1));
        this.squares.add(new Square(new Point(this.center.x - this.size/4, this.center.y + this.size/4), this.depth + 1));
        this.squares.add(new Square(new Point(this.center.x + this.size/4, this.center.y + this.size/4), this.depth + 1));
    }
}