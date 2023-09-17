Class {
	#name : #BbLinkContentPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-BlogBuilder-Presenter'
}

{ #category : #rendering }
BbLinkContentPresenter >> renderView [

	| linkContent |

	linkContent := self model.

	self view renderText: linkContent text url: linkContent url
]
