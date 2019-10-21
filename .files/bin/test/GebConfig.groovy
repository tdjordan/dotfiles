import org.openqa.selenium.Platform;
import org.openqa.selenium.remote.BrowserType;
import org.openqa.selenium.remote.CapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

driver = {
  def capabilities = new DesiredCapabilities();
  //capabilities.setCapability(CapabilityType.BROWSER_NAME, BrowserType.FIREFOX);
  capabilities.setCapability(CapabilityType.BROWSER_NAME, BrowserType.CHROME);
  capabilities.setCapability(CapabilityType.PLATFORM_NAME, Platform.LINUX);
  capabilities.setCapability("screenResolution", "1280x720");
  capabilities.setCapability("tz", "Asia/Tokyo");

  def remoteWebDriverUrl = new URL("http://localhost:4444/wd/hub")
  new RemoteWebDriver(remoteWebDriverUrl, capabilities)
}
