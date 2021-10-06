import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
//require("jquery")
import 'jquery';
import 'bootstrap';
//import '../stylesheets/application';
import "cocoon"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
