using AplineSkiHouse.Controllers;
using Microsoft.Extensions.Logging;
using Moq;
using Shouldly;
using Xunit;

namespace AlpineSkiHouseTests
{
    public class HomeControllerTests
    {
        HomeController controller;

        public HomeControllerTests()
        {
            var logger = new Mock<ILogger<HomeController>>();
            controller = new HomeController(logger.Object);
        }

        [Fact]
        public void Index_NavigateToIndexPage_ReturnIndexView()
        {
            var indexView = controller.Index();

            indexView.ShouldNotBeNull();
        }

        [Fact]
        public void Privacy_NavigateToPrivacyPage_ReturnPrivacyView()
        {
            var privacyView = controller.Index();

            privacyView.ShouldNotBeNull();
        }
    }
}
