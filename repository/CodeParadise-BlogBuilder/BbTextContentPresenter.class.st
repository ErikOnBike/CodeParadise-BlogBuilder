Class {
	#name : #BbTextContentPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-BlogBuilder-Presenter'
}

{ #category : #rendering }
BbTextContentPresenter >> renderView [

	| textContent |

	textContent := self model.

	self view renderText: textContent text
]
