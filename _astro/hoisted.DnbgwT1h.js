const o=new IntersectionObserver(e=>{e.forEach(s=>{s.isIntersecting?s.target.classList.add("showww"):s.target.classList.remove("showww")})}),r=document.querySelectorAll(".hiddennn");r.forEach(e=>o.observe(e));