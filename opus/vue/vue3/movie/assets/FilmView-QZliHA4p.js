import{g as me}from"./zhang-Ep8qlBuK.js";import{d as we,r as f,c as Ce,o as te,a,b as i,e as s,t as n,f as p,g as L,h as r,n as le,F as k,i as _,j as J,k as ae,u as xe,l as je,s as Se,m as ne,_ as Ie}from"./index-CUj4cCHW.js";const Le={class:"back"},Ne={class:"a1"},$e=["src"],De={class:"a1b"},ze={class:"a1ba"},Je={class:"a1ca"},Oe={class:"top"},Be={class:"score"},Re={style:{"text-align":"center"}},Ve={class:"sc"},We={class:"sunm"},Fe={class:"content"},Ae={class:"c1"},Me={class:"c1a"},Pe={class:"c1b"},Ee={key:0,class:"d1"},Ue={class:"d1a"},Te={class:"d1b"},Ge=["src","onClick"],He={key:1,class:"e1"},Ke={class:"e1a"},Qe={class:"e1aa"},Xe={class:"e1b"},Ye=["onClick"],Ze={class:"f1a"},qe={class:"f1aa"},st={class:"f1b"},et={key:3,class:"j"},tt={class:"j2"},lt={class:"j3"},at={class:"j3a"},nt={class:"j3aa"},it={class:"j3aaa"},ot={key:0,src:"https://obj.pipi.cn/festatic/common/image/398f1eddf16521a5205a5417fb4c99e0.png",alt:""},ut={key:1,src:"https://obj.pipi.cn/festatic/common/image/2cff8f94a4f83f464be185fb2279a365.png",alt:""},dt={key:2,src:"https://obj.pipi.cn/festatic/common/image/d01ce8fba731fb827e1d412efb94f025.png",alt:""},rt={key:3,src:"https://obj.pipi.cn/festatic/common/image/c853ef8e3cb69ad7bced9c38c39af045.png",alt:""},vt={key:4,src:"https://obj.pipi.cn/festatic/common/image/e3137a2114dfa0f5da5f0d6f5743c8cf.png",alt:""},pt={key:5,src:"https://obj.pipi.cn/festatic/common/image/57da8b3f82af5d61cedb29cf54b0d2ce.png",alt:""},gt={class:"j3aab"},ct={key:1},ft=["onClick"],bt={class:"j3b"},ht={class:"j3c"},kt={class:"jjj"},_t={key:4,class:"k"},yt={class:"k2a"},mt={key:0},wt={key:1},Ct={class:"kkk"},xt={class:"g"},jt={class:"g1"},St={class:"g1a"},It={class:"g1aa"},Lt={class:"g1b"},Nt={key:0,class:"g1ba"},$t={key:1,class:"g1ba"},Dt={key:2,class:"g1ba"},zt={key:3,class:"g1ba"},Jt={class:"g1bb"},Ot={key:5,class:"h"},Bt={class:"h1"},Rt={class:"h1a"},Vt={class:"h1aa"},Wt={class:"h1ba"},Ft={class:"h1bb"},At={class:"h1bba"},Mt={class:"h1bbb"},Pt={class:"h1bbba"},Et={class:"h1bbbb"},Ut={class:"z-all"},Tt={class:"z"},Gt={class:"z2"},Ht=["onClick"],Kt={class:"i"},Qt=we({__name:"FilmView",setup(Xt){const O=xe(),C=je(),u=f(""),N=f(""),z=f(""),o=f(""),b=f(""),x=f([]),ie=f([]),oe=f(!0),I=f(!1),ue=f(!1);me(O.query.movieId).then(l=>{o.value=l.data,u.value=l.data.movie,N.value=l.data.celebrities,z.value=l.data.feedVideos,b.value=l.data.comments,ue.value=l.data.realtime,x.value=l.data.questions,ie.value=l.data.filmReviews,oe.value=!1});const B=()=>{I.value=!I.value},de=l=>{C.push({path:"/stage",query:{movieId:l.id,photosnm:l.nm}})},re=l=>{C.push({path:"/crew",query:{movieId:l.id}})},ve=l=>{C.push({path:"/fvideo",query:{movieId:l.product.productId}})},pe=l=>{C.push({path:"/fil",query:{movieId:l.id}})},ge=l=>{C.push({path:"/fvideo",query:{movieId:l.id}})},R=Ce(()=>{var l,t,d,v,g;return((t=(l=b==null?void 0:b.value)==null?void 0:l.hotComments)==null?void 0:t.length)>5?(v=(d=b==null?void 0:b.value)==null?void 0:d.hotComments)==null?void 0:v.slice(5):(g=b==null?void 0:b.value)==null?void 0:g.hotComments}),ce=l=>{const t=N.value.map(d=>d.avatar);Se({images:t,startPosition:l})},fe=l=>{const t=JSON.parse(localStorage.getItem("token")),d=JSON.parse(localStorage.getItem("users"))||[];if(t){const v=t,g=d.find(w=>w.username===v);if(g){Array.isArray(g.wantwatch)||(g.wantwatch=[]);const w=g.wantwatch.findIndex(D=>JSON.stringify(D)===JSON.stringify(l));w===-1?g.wantwatch.push(l):g.wantwatch.splice(w,1),localStorage.setItem("users",JSON.stringify(d)),$.value=g.wantwatch}else console.error("用户未找到")}else C.push({path:"/login",query:{target:O.fullPath}})},$=f([]);te(()=>{const l=JSON.parse(localStorage.getItem("token")),t=JSON.parse(localStorage.getItem("users"))||[],d=l,v=t.find(g=>g.username===d);v&&Array.isArray(v.wantwatch)?$.value=v.wantwatch:$.value=[]});const be=l=>$.value.some(t=>t.id===l.id),y=f(new Set),m=f({}),he=()=>{const l=localStorage.getItem("likedComments");l&&(y.value=new Set(JSON.parse(l)));const t=localStorage.getItem("upCounts");t&&(m.value=JSON.parse(t))},ke=()=>{localStorage.setItem("likedComments",JSON.stringify([...y.value]))},_e=()=>{localStorage.setItem("upCounts",JSON.stringify(m.value))},ye=(l,t)=>{y.value.has(l)?(y.value.delete(l),m.value[l]>t&&(m.value[l]-=1)):(y.value.add(l),m.value[l]?m.value[l]+=1:m.value[l]=t+1),ke(),_e()};return te(()=>{he()}),(l,t)=>{var g,w,D,V,W,F,A,M,P,E,U,T,G,H,K,Q,X,Y,Z,q,ss,es,ts,ls,as,ns,is,os,us,ds,rs,vs,ps,gs,cs,fs,bs,hs,ks,_s,ys,ms,ws,Cs,xs,js,Ss,Is,Ls,Ns,$s,Ds,zs,Js,Os,Bs,Rs,Vs,Ws,Fs,As,Ms,Ps,Es,Us,Ts,Gs,Hs,Ks,Qs,Xs,Ys,Zs,qs,se;const d=ne("van-icon"),v=ne("van-image");return o.value?(a(),i("div",{key:0,class:"a",style:le({backgroundColor:u.value.backgroundColor})},[s("div",Le,[s("p",{class:"backa",onClick:t[0]||(t[0]=e=>l.$router.back())},"猫眼电影"),t[7]||(t[7]=s("span",null,">",-1)),s("p",null,n((g=u.value)==null?void 0:g.nm),1)]),s("div",Ne,[s("div",{onClick:t[1]||(t[1]=e=>ge(u.value)),class:"a1a"},[s("img",{src:(w=u.value)==null?void 0:w.img,alt:""},null,8,$e),p(d,{name:"play"})]),s("div",De,[s("h3",null,n((D=u.value)==null?void 0:D.nm),1),s("div",ze,[s("p",null,n((V=u.value)==null?void 0:V.enm),1),s("p",null,n((F=(W=u.value)==null?void 0:W.cat)==null?void 0:F.split(",").join(" / ")),1),s("p",null,n((M=(A=u.value)==null?void 0:A.star)==null?void 0:M.split(",").join(" / ")),1),s("p",null,[L(n((P=u.value)==null?void 0:P.pubDesc)+" / ",1),s("span",null,n(((E=u.value)==null?void 0:E.episodeDur)!==0?`${(U=u.value)==null?void 0:U.episodeDur}分钟`:`${(T=u.value)==null?void 0:T.dur}分钟`),1)])]),s("div",{class:"a1c",onClick:t[2]||(t[2]=e=>fe(u.value))},[s("span",Je,[t[8]||(t[8]=s("img",{src:"https://obj.pipi.cn/festatic/asgard/resources/images/movie/want-to-watch.png",alt:""},null,-1)),s("p",null,n(be(u.value)?"已想看":"想看"),1)])])])]),s("div",{class:"filmReview b1",onClick:t[3]||(t[3]=e=>l.$router.push({path:"/watchdata",query:{movieId:o.value.movie.id,nm:o.value.movie.nm,pubDesc:o.value.movie.pubDesc,img:o.value.movie.img}}))},[s("div",Oe,[t[9]||(t[9]=s("div",{style:{display:"flex"}},[s("img",{src:"https://obj.pipi.cn/festatic/asgard/resources/images/movie/logo-new.png",alt:""}),s("span",{style:{color:"#fff"}},"猫眼购票评分")],-1)),s("div",null,[s("span",null,n((H=(G=o.value)==null?void 0:G.realtime)==null?void 0:H.wish)+" 人想看",1),s("span",null,n((Q=(K=o.value)==null?void 0:K.realtime)==null?void 0:Q.watched)+" 人看过",1)])]),s("div",Be,[s("div",Re,[s("span",Ve,n((Y=(X=o.value)==null?void 0:X.movie)==null?void 0:Y.sc),1),t[10]||(t[10]=L()),t[11]||(t[11]=s("br",null,null,-1)),s("span",We,n((q=(Z=o.value)==null?void 0:Z.movie)==null?void 0:q.snum)+"人评",1)]),t[12]||(t[12]=s("div",null,null,-1))]),s("p",Fe,[p(d,{name:"good-job-o",size:"14rem",style:{"margin-right":"4rem"}}),L(n((ts=(es=(ss=o.value)==null?void 0:ss.movie)==null?void 0:es.shortComment)==null?void 0:ts.content),1)])]),s("div",Ae,[s("div",Me,[t[15]||(t[15]=s("p",null,"简介",-1)),I.value?r("",!0):(a(),i("div",{key:0,class:"c1aa",onClick:B},[t[13]||(t[13]=s("span",null,"展开",-1)),p(d,{name:"arrow-down"})])),I.value?(a(),i("div",{key:1,class:"c1aa",onClick:B},[t[14]||(t[14]=s("span",null,"收起",-1)),p(d,{name:"arrow-up"})])):r("",!0)]),s("div",Pe,[s("p",{style:le(I.value?{}:{"-webkit-line-clamp":3})},n((ns=(as=(ls=u.value)==null?void 0:ls.shareInfo)==null?void 0:as.content)==null?void 0:ns.slice(3)),5)])]),N.value?(a(),i("div",Ee,[s("div",Ue,[t[17]||(t[17]=s("p",null,"演职人员",-1)),s("div",{class:"d1aa",onClick:t[4]||(t[4]=e=>re(u.value))},[t[16]||(t[16]=s("span",null,"全部",-1)),p(d,{name:"arrow"})])]),s("div",Te,[(a(!0),i(k,null,_(N.value,(e,c)=>(a(),i("div",{class:"d1ba",key:c},[s("img",{src:e==null?void 0:e.avatar,alt:"",onClick:h=>ce(c)},null,8,Ge),s("p",null,n(e==null?void 0:e.cnm),1),s("span",null,n(e==null?void 0:e.desc),1)]))),128))])])):r("",!0),(is=z.value)!=null&&is.feeds?(a(),i("div",He,[s("div",Ke,[t[19]||(t[19]=s("p",null,"视频",-1)),s("div",Qe,[t[18]||(t[18]=s("span",null,"全部",-1)),p(d,{name:"arrow"})])]),s("div",Xe,[(a(!0),i(k,null,_((os=z.value)==null?void 0:os.feeds,(e,c)=>{var h;return a(),i("div",{onClick:j=>ve(e),class:"eaba",key:c},[p(v,{width:"140rem",height:"100rem",fit:"cover",src:(h=e==null?void 0:e.images[0])==null?void 0:h.url},null,8,["src"]),p(d,{name:"play"})],8,Ye)}),128))])])):r("",!0),(us=u.value)!=null&&us.photos?(a(),i("div",{key:2,class:"f1",onClick:t[5]||(t[5]=e=>de(u.value))},[s("div",Ze,[t[20]||(t[20]=s("p",null,"剧照",-1)),s("div",qe,[s("span",null,"全部"+n((ds=u.value)==null?void 0:ds.pn)+"张",1),p(d,{name:"arrow"})])]),s("div",st,[(a(!0),i(k,null,_((rs=u.value)==null?void 0:rs.photos,e=>(a(),i("div",{class:"faba",key:e.id},[p(v,{width:"140rem",height:"100rem",fit:"cover",src:e},null,8,["src"])]))),128))])])):r("",!0),((vs=R.value)==null?void 0:vs.length)>0?(a(),i("div",et,[t[22]||(t[22]=s("p",{class:"jp"},"短评",-1)),(a(!0),i(k,null,_(R.value,e=>{var c,h;return a(),i("div",{class:"j1",key:e.id},[s("div",tt,[p(v,{round:"",width:"33rem",height:"33rem",src:e==null?void 0:e.avatarUrl},null,8,["src"])]),s("div",lt,[s("div",at,[s("div",nt,[s("div",it,[s("p",null,n(e==null?void 0:e.nick),1),(e==null?void 0:e.userLevel)===6?(a(),i("img",ot)):r("",!0),(e==null?void 0:e.userLevel)===5?(a(),i("img",ut)):r("",!0),(e==null?void 0:e.userLevel)===4?(a(),i("img",dt)):r("",!0),(e==null?void 0:e.userLevel)===3?(a(),i("img",rt)):r("",!0),(e==null?void 0:e.userLevel)===2?(a(),i("img",vt)):r("",!0),(e==null?void 0:e.userLevel)===1?(a(),i("img",pt)):r("",!0)]),s("div",gt,[(a(!0),i(k,null,_(Math.floor((e==null?void 0:e.score)/2),(j,S)=>(a(),J(v,{src:"https://obj.pipi.cn/festatic/asgard/resources/images/movie/star-full-graded.png",key:S}))),128)),(e==null?void 0:e.score)%2===1?(a(),J(v,{key:0,src:"	https://obj.pipi.cn/festatic/asgard/resources/images/movie/star-half-graded.png"})):r("",!0),(a(!0),i(k,null,_(Math.floor((10-(e==null?void 0:e.score))/2),(j,S)=>(a(),J(v,{src:"	https://obj.pipi.cn/festatic/asgard/resources/images/movie/star-not-graded.png",key:S}))),128)),s("span",null,n(e==null?void 0:e.score)+"分",1),(c=e==null?void 0:e.tagList[0])!=null&&c.name?(a(),i("p",ct,n((h=e==null?void 0:e.tagList[0])==null?void 0:h.name),1)):r("",!0)])]),s("div",{class:ae(["j3ab",{liked:y.value.has(e.id)}]),onClick:j=>ye(e.id,e.upCount)},[p(d,{name:y.value.has(e.id)?"good-job":"good-job-o"},null,8,["name"]),s("p",{class:ae({likedText:y.value.has(e.id)})},n(m.value[e.id]||e.upCount),3)],10,ft)]),s("div",bt,[s("p",null,n(e==null?void 0:e.content),1)]),s("div",ht,[s("span",null,n(new Date(e==null?void 0:e.time).toLocaleDateString("zh-CN",{month:"2-digit",day:"2-digit"})),1)]),t[21]||(t[21]=s("span",{class:"jhx"},null,-1))])])}),128)),s("div",kt,[s("p",null,"共"+n((ps=b.value)==null?void 0:ps.total)+"个短评>",1)])])):r("",!0),t[40]||(t[40]=s("div",{class:"hx"},null,-1)),x.value&&((gs=x.value)!=null&&gs.questions)&&((fs=(cs=x.value)==null?void 0:cs.questions)==null?void 0:fs.length)>0?(a(),i("div",_t,[t[24]||(t[24]=s("div",{class:"k1"},[s("p",null,"讨论")],-1)),(a(!0),i(k,null,_((bs=x.value)==null?void 0:bs.questions,(e,c)=>{var h,j,S,ee;return a(),i("div",{class:"k2",key:c},[s("div",yt,[s("h3",null,n((h=e==null?void 0:e.question)==null?void 0:h.content),1),s("span",null,n((j=e==null?void 0:e.question)==null?void 0:j.answerCnt)+"个讨论",1)]),(S=e==null?void 0:e.answer)!=null&&S.content?(a(),i("p",mt,n((ee=e==null?void 0:e.answer)==null?void 0:ee.content),1)):(a(),i("p",wt,"暂无讨论")),t[23]||(t[23]=s("span",{class:"khx"},null,-1))])}),128)),s("div",Ct,[s("p",null,"共"+n((hs=x.value)==null?void 0:hs.total)+"个讨论>",1)])])):r("",!0),t[41]||(t[41]=s("div",{class:"hx"},null,-1)),s("div",xt,[s("div",jt,[s("div",St,[t[26]||(t[26]=s("p",null,"票房",-1)),s("div",It,[t[25]||(t[25]=s("span",null,"票房详情",-1)),p(d,{name:"arrow"})])]),s("div",Lt,[(ys=(_s=(ks=o.value)==null?void 0:ks.mbox)==null?void 0:_s.mbox)!=null&&ys.firstWeekBox&&((Cs=(ws=(ms=o.value)==null?void 0:ms.mbox)==null?void 0:ws.mbox)!=null&&Cs.lastDayRank)?(a(),i("div",Nt,[s("span",null,n((Ss=(js=(xs=o.value)==null?void 0:xs.mbox)==null?void 0:js.mbox)==null?void 0:Ss.lastDayRank),1),t[27]||(t[27]=s("p",null,"昨日排行",-1))])):r("",!0),(Ns=(Ls=(Is=o.value)==null?void 0:Is.mbox)==null?void 0:Ls.mbox)!=null&&Ns.firstWeekBox&&((zs=(Ds=($s=o.value)==null?void 0:$s.mbox)==null?void 0:Ds.mbox)!=null&&zs.lastDayRank)?(a(),i("div",$t,[s("span",null,n((Rs=(Bs=(Os=(Js=o.value)==null?void 0:Js.mbox)==null?void 0:Os.mbox)==null?void 0:Bs.firstWeekBox)==null?void 0:Rs.toLocaleString()),1),t[28]||(t[28]=s("p",null,"首周票房(万)",-1))])):(Fs=(Ws=(Vs=o.value)==null?void 0:Vs.mbox)==null?void 0:Ws.mbox)!=null&&Fs.firstWeekBox?(a(),i("div",Dt,[s("span",null,n((Es=(Ps=(Ms=(As=o.value)==null?void 0:As.mbox)==null?void 0:Ms.mbox)==null?void 0:Ps.firstWeekBox)==null?void 0:Es.toLocaleString()),1),t[29]||(t[29]=s("p",null,"首周票房(万)",-1))])):(a(),i("div",zt,[s("span",null,n((Gs=(Ts=(Us=o.value)==null?void 0:Us.mbox)==null?void 0:Ts.mbox)==null?void 0:Gs.lastDayRank),1),t[30]||(t[30]=s("p",null,"昨日排行",-1))])),s("div",Jt,[s("span",null,n((Xs=(Qs=(Ks=(Hs=o.value)==null?void 0:Hs.mbox)==null?void 0:Ks.mbox)==null?void 0:Qs.sumBox)==null?void 0:Xs.toLocaleString()),1),t[31]||(t[31]=s("p",null,"累计票房(万)",-1))])])])]),t[42]||(t[42]=s("div",{class:"hx"},null,-1)),((Zs=(Ys=o.value)==null?void 0:Ys.newsList)==null?void 0:Zs.newsList.length)>0?(a(),i("div",Ot,[s("div",Bt,[s("div",Rt,[t[33]||(t[33]=s("p",null,"相关资讯",-1)),s("div",Vt,[t[32]||(t[32]=s("span",null,"全部",-1)),p(d,{name:"arrow"})])]),(a(!0),i(k,null,_((se=(qs=o.value)==null?void 0:qs.newsList)==null?void 0:se.newsList,e=>{var c;return a(),i("div",{class:"h1b",key:e.id},[t[36]||(t[36]=s("div",{class:"hengxian"},null,-1)),s("div",Wt,[s("p",null,n(e==null?void 0:e.title),1),p(v,{width:"220rem",height:"76rem",fit:"cover",src:(c=e==null?void 0:e.previewImages[0])==null?void 0:c.url},null,8,["src"])]),s("div",Ft,[s("div",At,[s("p",null,n(e==null?void 0:e.source),1),s("span",null,n(new Date(e==null?void 0:e.created).toLocaleDateString("zh-CN",{year:"numeric",month:"2-digit",day:"2-digit"})),1)]),s("div",Mt,[s("div",Pt,[t[34]||(t[34]=s("img",{src:"https://obj.pipi.cn/festatic/asgard/resources/images/movie/read-num.png",alt:""},null,-1)),s("p",null,n(e==null?void 0:e.viewCount),1)]),s("div",Et,[t[35]||(t[35]=s("img",{src:"https://obj.pipi.cn/festatic/asgard/resources/images/movie/replying-comments.png",alt:""},null,-1)),s("p",null,n(e==null?void 0:e.type),1)])])])])}),128))])])):r("",!0),t[43]||(t[43]=s("div",{class:"hx"},null,-1)),s("div",Ut,[s("div",Tt,[t[37]||(t[37]=s("div",{class:"z1"},[s("p",null,"相关影片")],-1)),s("div",Gt,[(a(!0),i(k,null,_(o.value.relatedMovies,e=>(a(),i("div",{onClick:c=>pe(e),class:"z2a",key:e.id},[p(v,{width:"88rem",height:"120rem",fit:"contain",src:e==null?void 0:e.img},null,8,["src"]),s("p",null,n(e==null?void 0:e.title),1)],8,Ht))),128))])])]),t[44]||(t[44]=s("footer",null,[s("p",null,[L("影视行业信息 "),s("span",null,"《免责声明》"),L(" I 违法和不良信息举报电话：123456789")]),s("img",{src:"https://obj.pipi.cn/festatic/asgard/resources/images/movie/bottom-logo.png",alt:""})],-1)),s("div",Kt,[t[39]||(t[39]=s("div",{class:"i1"},[s("img",{src:"https://obj.pipi.cn/festatic/asgard/resources/images/movie/share-icon.png",alt:""})],-1)),s("div",{class:"i-all",onClick:t[6]||(t[6]=e=>l.$router.push({path:"/movieintro",query:{movieId:u.value.id}}))},t[38]||(t[38]=[s("div",{class:"i2"},[s("p",null,"特惠购票")],-1)]))])],4)):r("",!0)}}}),qt=Ie(Qt,[["__scopeId","data-v-95c5a384"]]);export{qt as default};