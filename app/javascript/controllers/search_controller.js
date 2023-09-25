// app/javascript/controllers/search_controller.js

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["query"];

  search() {
    const query = this.queryTarget.value;
    const searchForm = document.querySelector("form");

    if (query.trim() === "") {
      searchForm.action = "/";
    } else {
      searchForm.action = `/courses?search=${encodeURIComponent(query)}`;
    }

    searchForm.submit();
  }
}
