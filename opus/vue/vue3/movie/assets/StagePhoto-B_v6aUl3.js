import{a as P}from"./zhang-Ep8qlBuK.js";import{d as b,r as l,c as S,a,b as n,e as c,f as u,p as I,h as d,F as B,i as N,n as V,s as q,u as x,l as F,m as i,_ as L}from"./index-CUj4cCHW.js";const R={class:"a"},$={class:"photo-all"},z=b({__name:"StagePhoto",setup(E){const p=l(!1),g=t=>{const e=o.value.map(r=>r.olink);q({images:e,startPosition:t})},v=x(),m=F(),o=l([]);P(v.query.movieId,v.query.photosnm).then(t=>{o.value=t.data.photos,p.value=!0});const s=l(!1),f=()=>{s.value=!s.value},k=()=>{m.push({path:"/"})},C=S(()=>o.value.length>32?{}:{height:"100vh"});return(t,e)=>{const r=i("van-nav-bar"),y=i("van-icon"),w=i("van-image");return p.value?(a(),n("div",{key:0,class:"photo",style:V(C.value)},[c("div",R,[u(r,{title:"剧照","left-arrow":"",onClickLeft:e[0]||(e[0]=h=>I(m).back())}),u(y,{name:"wap-nav",onClick:f})]),s.value?(a(),n("div",{key:0,onClick:k,class:"popup"},e[1]||(e[1]=[c("p",null,"首页",-1)]))):d("",!0),c("div",$,[(a(!0),n(B,null,N(o.value,(h,_)=>(a(),n("div",{class:"photoa",key:_},[u(w,{width:"86rem",height:"86rem",fit:"cover",src:h.olink,onClick:j=>g(_)},null,8,["src","onClick"])]))),128))])],4)):d("",!0)}}}),G=L(z,[["__scopeId","data-v-bc58a29c"]]);export{G as default};