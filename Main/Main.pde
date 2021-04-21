int MAXDEPTH = 5;
float PERLINCOEFF = 0.01;

Square test;

void setup(){
    size(950, 950);
    frameRate(30);
    noiseSeed(0);
    rectMode(CENTER);
    colorMode(HSB, 255);

    test = new Square(new Point(width/2, height/2));
}

void draw(){
    background(0);

    test.display();
}

void draw_point(Point p){
    point(p.x, p.y);
}
void draw_square(Point c, float s){
    rect(c.x, c.y, s, s);
}
void keyPressed() {
    if(key == '+'){
        MAXDEPTH++;
    } else if(key == '-'){
        MAXDEPTH--;
    }
}