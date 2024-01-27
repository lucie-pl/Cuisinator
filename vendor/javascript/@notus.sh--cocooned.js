class Emitter{constructor(t=["cocooned"]){this.#t=t}emit(t,e,i={}){return!this.#e(t,e,i).some((t=>t.defaultPrevented))}#t;#e(t,e,i={}){const n=this.#i(e,i);n.forEach((e=>this.#n(t,e)));return n}#n(t,e){return t.dispatchEvent(e)}#i(t,e){return this.#t.map((i=>this.#r(`${i}:${t}`,e)))}#r(t,e){return new CustomEvent(t,{bubbles:true,cancelable:true,detail:e})}}function uuidv4(){return([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g,(t=>(t^crypto.getRandomValues(new Uint8Array(1))[0]&15>>t/4).toString(16)))}function hideMarkedForDestruction(t,e){e.forEach((e=>{const i=e.querySelector('input[type=hidden][name$="[_destroy]"]');i!==null&&i.getAttribute("value")==="true"&&t.hide(e,{animate:false})}))}function defaultAnimator(t,e=false){e&&(t.dataset.cocoonedScrollHeight=t.scrollHeight);return[{height:`${t.dataset.cocoonedScrollHeight}px`,opacity:1},{height:`${t.dataset.cocoonedScrollHeight}px`,opacity:0},{height:0,opacity:0}]}const t=Object.create(null);class Base{static get defaultOptions(){const t=document.createElement("div");return{animate:"animate"in t&&typeof t.animate==="function",animator:defaultAnimator,duration:450}}static get eventNamespaces(){return["cocooned"]}static get selectors(){return{container:["[data-cocooned-container]",".cocooned-container"],item:["[data-cocooned-item]",".cocooned-item"]}}static getInstance(e){return t[e]}constructor(t,e){this._container=t;this._uuid=uuidv4();this._options=this.constructor._normalizeOptions({...this.constructor.defaultOptions,..."cocoonedOptions"in t.dataset?JSON.parse(t.dataset.cocoonedOptions):{},...e||{}})}get container(){return this._container}get options(){return this._options}start(){this.container.dataset.cocoonedContainer=true;this.container.dataset.cocoonedUuid=this._uuid;t[this._uuid]=this;const hideDestroyed=()=>{hideMarkedForDestruction(this,this.items)};hideDestroyed();this.container.ownerDocument.addEventListener("page:load",hideDestroyed);this.container.ownerDocument.addEventListener("turbo:load",hideDestroyed);this.container.ownerDocument.addEventListener("turbolinks:load",hideDestroyed)}notify(t,e,i){return this._emitter.emit(t,e,i)}get items(){return Array.from(this.container.querySelectorAll(this._selector("item"))).filter((t=>this.toContainer(t)===this.container)).filter((t=>!("display"in t.style&&t.style.display==="none")))}toContainer(t){return t.closest(this._selector("container"))}toItem(t){return t.closest(this._selector("item"))}contains(t){return this.items.includes(this.toItem(t))}hide(t,e={}){const i=this._animationOptions(e);const n=i.animator(t,true);const after=()=>{t.style.display="none"};return i.animate?t.animate(n,i.duration).finished.then(after).then((()=>t)):Promise.resolve(after()).then((()=>t))}show(t,e={}){const i=this._animationOptions(e);const n=i.animator(t,false).reverse();const before=()=>{t.style.display=null};const r=Promise.resolve(before());return i.animate?r.then((()=>t.animate(n,i.duration).finished)).then((()=>t)):r.then((()=>t))}static _normalizeOptions(t){return t}_container;_options;__uuid;__emitter;get _emitter(){typeof this.__emitter==="undefined"&&(this.__emitter=new Emitter(this.constructor.eventNamespaces));return this.__emitter}_selectors(t){return this.constructor.selectors[t]}_selector(t){return this._selectors(t).join(", ")}_animationOptions(t){const e=(({animate:t,animator:e,duration:i})=>({animate:t,animator:e,duration:i}))(this._options);return{...e,...t}}}class Trigger{constructor(t,e){this._trigger=t;this._cocooned=e}get trigger(){return this._trigger}handle(t){throw new TypeError("handle() must be defined in subclasses")}_cocooned;_trigger;get _item(){return this._cocooned.toItem(this._trigger)}get _notified(){return this._item}_notify(t,e){return this._cocooned.notify(this._notified,t,this._eventData(e))}_eventData(t){return{link:this._trigger,node:this._item,cocooned:this._cocooned,originalEvent:t}}_hide(t,e){return this._cocooned.hide(t,e)}_show(t,e){return this._cocooned.show(t,e)}}const e=/[\\^$.*+?()[\]{}|]/g;const i=RegExp(e.source);class Replacement{attribute;constructor(t,e,i,n=null){this.attribute=t;this.#o=e;this.#s=i;this.#a=n||i}apply(t,e){const i=t.getAttribute(this.attribute);this.#c.test(i)&&t.setAttribute(this.attribute,i.replace(this.#c,this.#d(e)))}#o;#s;#a;#d(t){return`${this.#s}${t}${this.#a}$1`}get#c(){const t=this.#l(`${this.#s}${this.#o}${this.#a}`);return new RegExp(`${t}(.*?)`,"g")}#l(t){return t&&i.test(t)?t.replace(e,"\\$&"):t||""}}class Builder{constructor(t,e){this.#h=t;this.#u=e;this.#m=[new Replacement("for",e,"_"),new Replacement("id",e,"_"),new Replacement("name",e,"[","]")]}build(t){const e=this.#h.cloneNode(true);this.#m.forEach((i=>{e.querySelectorAll(`*[${i.attribute}]`).forEach((e=>i.apply(e,t)))}));return e}#u;#h;#m}class Traverser{constructor(t,e){this.#p=t;this.#g=e}resolve(t){if(this.#g in this.#p&&typeof this.#p[this.#g]==="function")return this._tryMethod(this.#g,t);if(this.#g in this.#p)return this._tryProperty(this.#g);const e=`_${this.#g}`;return e in this?this[e](t):null}#p;#g;_tryMethod(t,e){try{const i=this.#p[t](e);if(i instanceof HTMLElement)return i}catch(t){}return null}_tryProperty(t){const e=this.#p[t];return e instanceof HTMLElement?e:null}_parent(t){return this.#p.parentElement.matches(t)?this.#p.parentElement:null}_prev(t){return this.#p.previousElementSibling.matches(t)?this.#p.previousElementSibling:null}_next(t){return this.#p.nextElementSibling.matches(t)?this.#p.nextElementSibling:null}_siblings(t){return this.#p.parentElement.querySelector(t)}}class Deprecator{logger;package;version;constructor(t,e,i){this.version=t;this.package=e;this.logger=i}warn(t,e=null){if(t in this.#e)return;const i=`${t}. It will be removed from ${this.package} ${this.version}`;const n=e!==null?`, use ${e} instead`:"";this.logger.warn(`DEPRECATION WARNING: ${i}${n}.`);this.#e[t]=true}#e=Object.create(null)}const n=Object.create(null);function deprecator(t,e="Cocooned",i=console){const r=[t,e].join("#");r in n||(n[r]=new Deprecator(t,e,i));return n[r]}class Extractor{constructor(t){this.#f=t}extract(){return["builder","count","node","method"].reduce(((t,e)=>{const i=`_extract${e.charAt(0).toUpperCase()+e.slice(1)}`;const n=this[i]();n!==null&&(t[e]=n);return t}),{})}#f;get#_(){return this.#f.dataset}_extractBuilder(){if(!("template"in this.#_&&"association"in this.#_))return null;const t=document.querySelector(`template[data-name="${this.#_.template}"]`);return t===null?null:new Builder(t.content,`new_${this.#_.association}`)}_extractCount(){return"associationInsertionCount"in this.#_?parseInt(this.#_.associationInsertionCount,10):"count"in this.#_?parseInt(this.#_.count,10):null}_extractMethod(){return"associationInsertionMethod"in this.#_?this.#_.associationInsertionMethod:"before"}_extractNode(){if(!("associationInsertionNode"in this.#_))return this.#f.parentElement;const t=this.#_.associationInsertionNode;if(t==="this")return this.#f;if(!("associationInsertionTraversal"in this.#_))return this.#f.ownerDocument.querySelector(t);deprecator("3.0").warn("associationInsertionTraversal is deprecated");const e=new Traverser(this.#f,this.#_.associationInsertionTraversal);return e.resolve(t)}}class Validator{static validates(t){const e=new Validator(t);return e.validates()}constructor(t){this.#v=t}validates(){const t=new Set(Object.keys(this.#v));const e=new Set(["builder","count","node","method"]);const i=new Set(Array.from(e.values()).filter((e=>!t.has(e))));if(i.size!==0)throw new TypeError(`Missing options: ${Array.from(i.values()).join(", ")}`);this._validateBuilder();this._validateMethod()}#v;_validateBuilder(){const t=this.#v.builder;if(!(t instanceof Builder))throw new TypeError(`Invalid builder option: instance of Builder expected, got ${t.constructor.name}`)}_validateMethod(){const t=this.#v.method;const e=["after","before","append","prepend","replaceWith"];if(!e.includes(t))throw new TypeError(`Invalid method option: expected one of ${e.join(", ")}, got ${t}`)}}let r=0;function uniqueId(){return`${(new Date).getTime()}${r++}`}class Add extends Trigger{static create(t,e){const i=new Extractor(t);return new Add(t,e,i.extract())}constructor(t,e,i={}){super(t,e);this.#v={...this.#v,...i};Validator.validates(this.#v)}get insertionNode(){return this.#v.node}handle(t){for(let e=0;e<this.#v.count;e++){this.#y=this._build();if(!this._notify("before-insert",t))return false;this._insert();this._notify("after-insert",t)}}#y;#v={count:1};get _item(){return this.#y}get _notified(){return this.#v.node}_insert(){this.#v.node[this.#v.method](this._item)}_build(){return this.#v.builder.build(uniqueId()).firstElementChild}}class Remove extends Trigger{handle(t){if(!this._notify("before-remove",t))return false;this._hide(this._item).then((()=>{this._remove();this._notify("after-remove",t)}))}#b;get _notified(){typeof this.#b==="undefined"&&(this.#b=this._item.parentElement);return this.#b}_remove(){this._removable()?this._item.remove():this._markForDestruction()}_removable(){return this._trigger.matches(".dynamic")||"cocoonedPersisted"in this._trigger.dataset&&this._trigger.dataset.cocoonedPersisted==="false"}_markForDestruction(){this._item.querySelector('input[type=hidden][name$="[_destroy]"]').setAttribute("value","true");this._item.querySelectorAll("input[required], select[required]").forEach((t=>t.removeAttribute("required")))}}function clickHandler$1(t){return e=>{e.preventDefault();t(e)}}function delegatedClickHandler(t,e){const i=clickHandler$1(e);return e=>{const{target:n}=e;n.closest(t)!==null&&i(e)}}function itemDelegatedClickHandler(t,e,i){const n=delegatedClickHandler(e,i);return e=>{t.contains(e.target)&&n(e)}}const coreMixin=t=>class extends t{static get selectors(){return{...super.selectors,"triggers.add":['[data-cocooned-trigger="add"]',".cocooned-add"],"triggers.remove":['[data-cocooned-trigger="remove"]',".cocooned-remove"]}}start(){super.start();this.addTriggers=Array.from(this.container.ownerDocument.querySelectorAll(this._selector("triggers.add"))).map((t=>Add.create(t,this))).filter((t=>this.toContainer(t.insertionNode)===this.container));this.addTriggers.forEach((t=>t.trigger.addEventListener("click",clickHandler$1((e=>t.handle(e))))));this.container.addEventListener("click",itemDelegatedClickHandler(this,this._selector("triggers.remove"),(t=>{const e=new Remove(t.target,this);e.handle(t)})))}};let o=class Cocooned extends(coreMixin(Base)){static create(t,e){if("cocoonedUuid"in t.dataset)return Cocooned.getInstance(t.dataset.cocoonedUuid);const i=new this.constructor(t,e);i.start();return i}static start(){document.querySelectorAll("[data-cocooned-container], [data-cocooned-options]").forEach((t=>this.constructor.create(t)))}};const limitMixin=t=>class extends t{static get defaultOptions(){return{...super.defaultOptions,limit:false}}start(){super.start();this.options.limit!==false&&this.container.addEventListener("cocooned:before-insert",(t=>{if(!(this.items.length<this.options.limit)){t.preventDefault();this.notify(this.container,"limit-reached",t.detail)}}))}};class Move extends Trigger{handle(t){if(this._pivotItem!==null){if(!this._notify("before-move",t))return false;this._hide(this._item).then((()=>{this._move();this._show(this._item).then((()=>this._notify("after-move",t)))}))}}get _pivotItem(){throw new TypeError("_pivotItem() must be defined in subclasses")}_move(){throw new TypeError("_move() must be defined in subclasses")}_findPivotItem(t,e){let i=t;do{i=i[e];if(i!==null&&this._cocooned.contains(i))break}while(i!==null);return i}}class Up extends Move{#w;get _pivotItem(){typeof this.#w==="undefined"&&(this.#w=this._findPivotItem(this._item,"previousElementSibling"));return this.#w}_move(){this._pivotItem.before(this._item)}}class Down extends Move{#w;get _pivotItem(){typeof this.#w==="undefined"&&(this.#w=this._findPivotItem(this._item,"nextElementSibling"));return this.#w}_move(){this._pivotItem.after(this._item)}}class Reindexer{constructor(t,e=0){this.#E=t;this.#x=e}reindex(t){if(!this.#I("before-reindex",t))return false;this.#$.forEach(((t,e)=>t.setAttribute("value",e+this.#x)));this.#I("after-reindex",t)}#E;#x;get#$(){return this.#D.map((t=>t.querySelector('input[name$="[position]"]')))}get#D(){return this.#E.items}#I(t,e){return this.#E.notify(this.#E.container,t,this.#A(e))}#A(t){return{nodes:this.#D,cocooned:this.#E,originalEvent:t}}}function clickHandler(t,e,i){return itemDelegatedClickHandler(t,e,(e=>{const n=new i(e.target,t);n.handle(e)}))}const reorderableMixin=t=>class extends t{static get defaultOptions(){return{...super.defaultOptions,reorderable:false}}static get selectors(){return{...super.selectors,"triggers.up":['[data-cocooned-trigger="up"]',".cocooned-move-up"],"triggers.down":['[data-cocooned-trigger="down"]',".cocooned-move-down"]}}start(){super.start();if(this.options.reorderable===false)return;this.container.addEventListener("cocooned:after-insert",(t=>this._reindexer.reindex(t)));this.container.addEventListener("cocooned:after-remove",(t=>this._reindexer.reindex(t)));this.container.addEventListener("cocooned:after-move",(t=>this._reindexer.reindex(t)));const t=this.container.closest("form");t!==null&&t.addEventListener("submit",(t=>this._reindexer.reindex(t)));this.container.addEventListener("click",clickHandler(this,this._selector("triggers.up"),Up));this.container.addEventListener("click",clickHandler(this,this._selector("triggers.down"),Down))}static _normalizeOptions(t){const e=super._normalizeOptions(t);typeof e.reorderable==="boolean"&&e.reorderable&&(e.reorderable={startAt:1});return e}#k;get _reindexer(){typeof this.#k==="undefined"&&(this.#k=new Reindexer(this,this.options.reorderable.startAt));return this.#k}};const cocoonSupportMixin=t=>class extends t{static get eventNamespaces(){return[...super.eventNamespaces,"cocoon"]}static get selectors(){const t=super.selectors;t.item.push(".nested-fields");t["triggers.add"].push(".add_fields");t["triggers.remove"].push(".remove_fields");return t}};class Cocooned extends(reorderableMixin(limitMixin(cocoonSupportMixin(o)))){static create(t,e={}){if("cocoonedUuid"in t.dataset)return Cocooned.getInstance(t.dataset.cocoonedUuid);const i=new Cocooned(t,e);i.start();return i}static start(){document.querySelectorAll("[data-cocooned-container], [data-cocooned-options]").forEach((t=>Cocooned.create(t)))}}export{Cocooned as default};
