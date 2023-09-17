Class {
	#name : #BbImageContentPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-BlogBuilder-Presenter'
}

{ #category : #rendering }
BbImageContentPresenter >> renderView [

	| imageContent |

	imageContent := self model.

	"First set width and height to allow the browser to reserve the space"
	self view
		renderWidth: imageContent width height: imageContent height ;
		renderSrc: imageContent src title: imageContent title.

	imageContent description
		ifNotNil: [ :description | self renderChildViewForModel: description atSlotNamed: #description ]
		ifNil: [ self removeAllChildPresentersAtSlotNamed: #description ]
]
