function uploadCancel(page) {

    if (page === 1) {
        homePage_etat2.helloBox.visible = true
        homePage_etat2.boutons.visible = true
        homePage_etat2.check.visible = false
        console.log("cancel")

    }



}

function signIn() {

    homePage.etat1.visible = false
    homePage.etat2.visible = true;

}
