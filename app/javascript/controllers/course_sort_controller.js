import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="course-sort"
    targets=['select'];
export default class extends Controller {
  static targets=['select'];
  connect() {
    console.log("hello,Stimulus!",this.element);
  }
  sortCourse(){
    const sortBy=this.selectTarget.value
    const url =`course?sort_by=${sortBy}`;

    this.doTurboRequest(url);
  }
  doTurboRequest(url){
    fetch(url,{
      headers:{
        Accept: "text.vnd.turbo-stream.html",
      },
      })
      .then((response)=>response.text())
      .then((html)=> {
        Turbo.renderStreamMessage(html);
      });
  }
  update(){
    console.log("update");
    this.sortCourse();
  }
}
