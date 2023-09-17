Class {
	#name : #BbSectionPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-BlogBuilder-Presenter'
}

{ #category : #rendering }
BbSectionPresenter >> renderView [

	| section |

	section := self model.

	self view renderHeader: section header.

	self renderAllChildViewsForModels: section paragraphs atSlotNamed: #paragraphs
]
