<?php require __DIR__ . '/_db_connetion.php' ?>
<?php include __DIR__ . '/__html_header.php' ?>
<?php include __DIR__ . '/__html_nav.php' ?>

<div class="container">

        <form action="form_test_api.php" method="post">
            <input type="hidden" name="hid" value="hid">


            <div class="form-check">
                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
                <label class="form-check-label" for="exampleRadios1">
                    Default radio
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
                <label class="form-check-label" for="exampleRadios2">
                    Second default radio
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
                <label class="form-check-label" for="exampleRadios3">
                    3rd radio
                </label>
            </div>

            <hr>

            <div class="form-check">
                <input class="form-check-input" type="radio" name="group2" id="er1" value="option1">
                <label class="form-check-label" for="er1">
                    Default radio
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="group2" id="er2" value="option2">
                <label class="form-check-label" for="er2">
                    Second default radio
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="group2" id="er3" value="option3">
                <label class="form-check-label" for="er3">
                    3rd radio
                </label>
            </div>

            <hr>

            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="cb[]" value="option1">
                <label class="form-check-label" for="inlineCheckbox1">1</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="inlineCheckbox2" name="cb[]" value="option2">
                <label class="form-check-label" for="inlineCheckbox2">2</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="inlineCheckbox3" name="cb[]" value="option3" >
                <label class="form-check-label" for="inlineCheckbox3">3</label>
            </div>

            <hr>

            <button type="submit">送出</button>

        </form>


    </div>

<?php include __DIR__ . '/__html_footer.php' ?>
<?php include __DIR__ . '/__html_script.php' ?>
