Class {
	#name : #BbReferenceContentPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-BlogBuilder-Presenter'
}

{ #category : #rendering }
BbReferenceContentPresenter >> renderView [

	| reference |

	reference := self model.

	self view renderName: reference name
]
