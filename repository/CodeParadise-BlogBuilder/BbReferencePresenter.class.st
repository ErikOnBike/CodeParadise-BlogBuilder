Class {
	#name : #BbReferencePresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-BlogBuilder-Presenter'
}

{ #category : #rendering }
BbReferencePresenter >> renderView [

	| reference |

	reference := self model.

	self view renderName: reference name.

	self renderChildViewForModel: reference description atSlotNamed: #description
]
