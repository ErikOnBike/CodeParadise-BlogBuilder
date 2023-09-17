Class {
	#name : #BbBlockContentPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-BlogBuilder-Presenter'
}

{ #category : #rendering }
BbBlockContentPresenter >> renderView [

	| contentItems |

	contentItems := self model.

	self renderAllChildViewsForModels: contentItems
]
