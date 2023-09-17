Class {
	#name : #BaselineOfCpBlogBuilder,
	#superclass : #BaselineOf,
	#category : #BaselineOfCpBlogBuilder
}

{ #category : #baselines }
BaselineOfCpBlogBuilder >> baseline: spec [

	<baseline>

	spec for: #common do: [

		"Dependencies"
		spec
			baseline: 'CodeParadise' with: [ spec loads: #('Default') ; repository: 'github://ErikOnBike/CodeParadise' ].

		"Packages"
		spec
			package: 'CodeParadise-BlogBuilder' with: [ spec requires: #('CodeParadise') ].

		"Groups"
		spec 
			group: 'default' with: #( 'Core' );

			group: 'Core' with: #( 'CodeParadise-BlogBuilder' ) ].

]