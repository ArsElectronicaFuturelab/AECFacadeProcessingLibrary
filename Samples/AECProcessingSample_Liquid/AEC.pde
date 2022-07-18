
import java.awt.Color;
import org.aec.facade.*;

class AEC {
  AECPlugin plugin = new AECPlugin();
  HouseDrawer house = new HouseDrawer(plugin);
  
  public AEC() {
  }

  void init() {
    plugin.setFrameWidth(width);
    plugin.init();
    loadConfig();
  }
    
  void loadConfig() {
    plugin.loadConfig();
  }
  
  public void beginDraw() {
    scale(2 * plugin.scale, plugin.scale);
  }
  
  public void endDraw() {
    // reset of the transformation
    resetMatrix();
    
    loadPixels();
    plugin.update(pixels);
  }
  
  public void drawSides() {
    house.draw();
  }
  
  public void keyPressed(int value) {
    plugin.keyPressed(value, keyCode);
    
    if (value == 'i') {
      house.toggleIds();
    }
  }

  public void setActiveColor(Color c) {
    plugin.setActiveColor(c);
  }

  public void setInActiveColor(Color c) {
    plugin.setInActiveColor(c);
  }
  
  public int getScaleX() {
    return 2 * plugin.scale;
  }
  
  public int getScaleY() {
    return plugin.scale;
  }  
}
