@Grapes([
  @Grab("org.gebish:geb-core:2.1"),
  @Grab("org.seleniumhq.selenium:selenium-chrome-driver:3.11.0"),
  @Grab("org.seleniumhq.selenium:selenium-support:3.11.0"),
  //@GrabConfig(systemProperties='http.proxyHost=3.20.109.241,http.proxyPort=88,https.proxyHost=3.20.109.241,https.proxyPort=88')
])
import geb.Browser

Browser.drive {
  go "http://gebish.org"

  assert title == "Geb - Very Groovy Browser Automation"

  $("div.menu a.manuals").click()
  waitFor { !$("#manuals-menu").hasClass("animating") }

  $("#manuals-menu a")[0].click()

  assert title.startsWith("The Book Of Geb")
}
