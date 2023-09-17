Class {
	#name : #BbParagraphPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-BlogBuilder-Presenter'
}

{ #category : #rendering }
BbParagraphPresenter >> renderView [

	| paragraph |

	paragraph := self model.

	self view renderHeader: paragraph header.

	self renderAllChildViewsForModels: paragraph content atSlotNamed: #content
]
