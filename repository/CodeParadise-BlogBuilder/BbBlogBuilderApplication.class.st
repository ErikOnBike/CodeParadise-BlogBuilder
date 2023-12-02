Class {
	#name : #BbBlogBuilderApplication,
	#superclass : #CpMvpWebApplication,
	#instVars : [
		'blog'
	],
	#category : #'CodeParadise-BlogBuilder-Application'
}

{ #category : #accessing }
BbBlogBuilderApplication class >> app [

	^ #blog
]

{ #category : #accessing }
BbBlogBuilderApplication >> applicationModel [

	^ blog
]

{ #category : #accessing }
BbBlogBuilderApplication >> initialize [

	| globalBlog |

	super initialize.

	globalBlog := Smalltalk globals at: #GlobalBlog ifAbsentPut: [ BbBlog exampleBlog ].

	blog := globalBlog
]
