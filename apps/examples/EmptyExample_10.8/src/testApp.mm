#include "testApp.h"
#ifdef OF_SCREEN_SAVER
    #include "ofxScreenSaver_10_8.h"
#endif

//--------------------------------------------------------------
void testApp::setup() {
    ofSetFrameRate(60);
    ofEnableSmoothing();
    ofSetVerticalSync(true);
    ofBackground(0,0,0);
    
    ofDisableArbTex();
    
    cout << "---------------------------------------------------" << endl;
    cout << "testApp :: setup : calling setup " << ofGetWidth() << " x " << ofGetHeight() << endl;
    cout << "---------------------------------------------------" << endl;
    
    ofSeedRandom( ofGetHours() + ofGetMinutes() + ofGetSeconds() + ofGetMonth() + ofGetElapsedTimeMillis() );
    
    #ifdef OF_SCREEN_SAVER
        ofLogToConsole();
    #endif
    
    bDrawWhiteBg = false;
    lastSwitchTimef = ofGetElapsedTimef();
    bgColor.set(255);
}


//--------------------------------------------------------------
void testApp::update() {
    if(ofGetElapsedTimef() - lastSwitchTimef > 1.5f) {
        bDrawWhiteBg = !bDrawWhiteBg;
        lastSwitchTimef = ofGetElapsedTimef();
        bgColor.set( ofRandom(0, 255 ) );
    }
    
}

//--------------------------------------------------------------
void testApp::draw() {
    ofBackground( bgColor );
    float tc = (sin(ofGetElapsedTimef()*.6)*.5f+.5f);
    float tx = cos(ofGetElapsedTimef()) * 200.f + ofGetWidth()*.5f;
    
    ofSetColor( 255.f - bgColor.r );
    ofRect( tx - 18.f, ofGetHeight()*.5f - 16.f, 154.f, ofGetHeight() );
    
    
    ofSetColor( tc*255.f, 100.f, 230.f);
    ofDrawBitmapString("OF Screen Saver!", tx, ofGetHeight()*.5f);
}

//--------------------------------------------------------------
void testApp::exit() {
    cout << "testApp :: exit : " << endl;
}

//--------------------------------------------------------------
void testApp::keyPressed( int key ) {
    cout << "testApp :: keyPressed : " << key << endl;
}

//--------------------------------------------------------------
void testApp::keyReleased( int key ) {
    
}

#ifdef OF_APPLICATION
//--------------------------------------------------------------
void testApp::mouseMoved(int x, int y ){
    
}

//--------------------------------------------------------------
void testApp::mouseDragged(int x, int y, int button){
    
}

//--------------------------------------------------------------
void testApp::mousePressed(int x, int y, int button){
    
}

//--------------------------------------------------------------
void testApp::mouseReleased(int x, int y, int button){
    
}
#endif












