Class {
	#name : #BbImageContentView,
	#superclass : #CpView,
	#instVars : [
		'width',
		'height',
		'intrinsicWidth',
		'intrinsicHeight'
	],
	#category : #'CodeParadise-BlogBuilder-View'
}

{ #category : #'web resources' }
BbImageContentView class >> style [

	<webResource: #css>

	^'*, *:before, *:after {
		-moz-box-sizing: border-box;
		-webkit-box-sizing: border-box;
		box-sizing: border-box;
	}
	#container {
		margin-top: 14px;
		margin-bottom: 14px;
	}
	#image {
		text-align: center;
	}
	#image ::slotted(*) {
		max-width: 100%;
	}
	#title {
		text-align: center;
		font-size: .9em;
	}
	::slotted([slot="title"]:not(:empty))::before {
		content: "[ ";
	}
	::slotted([slot="title"]:not(:empty))::after {
		content: " ]";
	}'
]

{ #category : #'web resources' }
BbImageContentView class >> template [

	<webResource: #html>

	^ '<div id="container">
		<div id="image"><slot name="image"><img></slot></div>
		<div id="title"><slot name="title"></slot></div>
		<div id="description"><slot name="description"></slot></div>
	</div>'
]

{ #category : #initialization }
BbImageContentView >> initializeShadowRoot [

	super initializeShadowRoot.

	self updateSize
]

{ #category : #rendering }
BbImageContentView >> renderSrc: srcString title: titleString [

	| image |

	image := (self firstChildAtSlotNamed: #image)
		ifNil: [
			(self appendChild: #img asHtmlTag atSlotNamed: #image)
				when: CpLoadEvent send: #storeIntrinsicSize to: self ;
				yourself ].

	intrinsicWidth ifNotNil: [ image attributeAt: #width put: intrinsicWidth printString ].
	intrinsicHeight ifNotNil: [ image attributeAt: #height put: intrinsicHeight printString ].

	image
		attributeAt: #src put: srcString ;
		attributeAt: #alt put: titleString.

	titleString
		ifNotNil: [ self replaceAllChildrenWith: titleString asHtmlElement atSlotNamed: #title ]
		ifNil: [ self removeChildrenAtSlotNamed: #title ]
]

{ #category : #rendering }
BbImageContentView >> renderWidth: widthString height: heightString [

	"Use the specified width and height (both a String to allow
	percentage or 'em' values for example).

	Store the specified width and heightin instance variables to
	allow it to be used when updating the receiver's template
	(slots are preserved by default because they live outside
	the shadow DOM)."

	width := widthString.
	height := heightString.

	self updateSize
]

{ #category : #accessing }
BbImageContentView >> storeIntrinsicSize [

	| image |

	(image := self firstChildAtSlotNamed: #image)
		ifNil: [
			intrinsicWidth := nil.
			intrinsicHeight := nil.
			^ self ].

	intrinsicWidth := image propertyAt: #width.
	intrinsicHeight := image propertyAt: #height
]

{ #category : #rendering }
BbImageContentView >> updateSize [

	self
		styleAt: #'max-width' put: width ;
		styleAt: #'max-height' put: height
]
