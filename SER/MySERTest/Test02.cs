using System.Collections.Generic;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Firefox;

namespace MySER;

public class Test02
{
    private IWebDriver driver;
    public IDictionary<string, object> vars {get; private set;}
    private IJavaScriptExecutor js;
    [SetUp]
    public void SetUp() {
        FirefoxOptions firefoxOptions = new FirefoxOptions();
        firefoxOptions.AcceptInsecureCertificates = true;
        driver = new FirefoxDriver(firefoxOptions);
        js = (IJavaScriptExecutor)driver;
        vars = new Dictionary<string, object>();
    }
    [TearDown]
    protected void TearDown() {
        driver.Quit();
    }
    [Test]
    public void test02() {
        driver.Navigate().GoToUrl("https://localhost:7173/");
        driver.FindElement(By.Id("inputUsuario")).SendKeys("");
        driver.FindElement(By.Id("inputContraseña"));
        driver.FindElement(By.Id("inputContraseña")).SendKeys("");
        driver.FindElement(By.Id("btnIniciarSesion")).Click();
        
        string mensajeRecibido = driver.FindElement(By.Id("alertMessage")).Text;
        string mensajeEsperado = "Debe ingresar el usuario y contraseña";
        Assert.AreEqual(mensajeRecibido, mensajeEsperado);
    }
}