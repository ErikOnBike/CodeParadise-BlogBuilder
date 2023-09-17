Class {
	#name : #BbCodeContentPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-BlogBuilder-Presenter'
}

{ #category : #rendering }
BbCodeContentPresenter >> renderView [

	| codeContent |

	codeContent := self model.

	self view renderCode: codeContent code language: codeContent language
]
