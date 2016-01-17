

var siteMasterModule = (function () {

    //------------------Change page Location-------------//
    function changeLocation(location, directRedirect) {
        try {
           
            if (directRedirect != undefined && directRedirect != null && directRedirect) {
                window.location = location;
                return;
            }
            var applicationPath = GetApplicationPath();
            if (applicationPath != '/') {
                location = applicationPath + '/' + location;
            }
            else {
                if ((location.indexOf("/") == 0 && location.length > 1) || location == "/") {
                    location = '..' + location;
                }
                else {
                    location = '../' + location;
                }
            }
            window.location = location;

        }
        catch (err) {
        
        }
    }
    function openInNewTab(url) {
        window.open(url, '_blank');
    }
    

    return {

        changeLocation: changeLocation,
      openInNewTab: openInNewTab,
      
            

    };
})();


