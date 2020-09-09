# PhysicsKit
A 2D collision detection and physics engine written in Xojo. A direct port of [dyn4j], a Java 2D physics engine (version 4.0.0).

## Port Progress
Ported `RobustGeometry.java` but its test are failing.

## Main Files To Port
- [ ] collision
	- [ ] broadphase
		- [ ] AABBBroadphaseProxy.java
		- [ ] AbstractBroadphaseDetector.java
		- [ ] BatchBroadphaseDetector.java
		- [ ] BroadphaseDetector.java
		- [ ] BroadphaseFilter.java
		- [ ] BroadphaseFilterAdaptor.java
		- [ ] BroadphaseItem.java
		- [ ] BroadphasePair.java
		- [ ] BruteForceBroadphase.java
		- [ ] DefaultBroadphaseFilter.java
		- [ ] DynamicAABBTree.java
		- [ ] DynamicAABBTreeLeaf.java
		- [ ] DynamicAABBTreeNode.java
		- [ ] LazyAABBTree.java
		- [ ] LazyAABBTreeLeaf.java
		- [ ] LazyAABBTreeNode.java
		- [ ] Sap.java
	- [ ] continuous
		- [ ] ConservativeAdvancement.java
		- [ ] TimeOfImpact.java
		- [ ] TimeOfImpactDetector.java
	- [ ] manifold
		- [ ] ClippingManifoldSolver.java
		- [ ] IndexedManifoldPointId.java
		- [ ] Manifold.java
		- [ ] ManifoldPoint.java
		- [ ] ManifoldPointId.java
		- [ ] ManifoldSolver.java	
	- [ ] narrowphase
		- [ ] AbstractFallbackCondition.java
		- [ ] CircleDetector.java
		- [ ] DistanceDetector.java
		- [ ] Epa.java
		- [ ] ExpandingSimplex.java
		- [ ] ExpandingSimplexEdge.java
		- [ ] FallbackCondition.java
		- [ ] FallbackNarrowphaseDetector.java
		- [ ] Gjk.java
		- [ ] LinkPostProcessor.java
		- [ ] MinkowskiPenetrationSolver.java
		- [ ] MinkowskiSum.java
		- [ ] MinkowskiSumPoint.java
		- [ ] NarrowphaseDetector.java
		- [ ] NarrowphasePostProcessor.java
		- [ ] PairwiseTypedFallbackCondition.java
		- [ ] Penetration.java
		- [ ] Raycast.java
		- [ ] RaycastDetector.java
		- [ ] Sat.java
		- [ ] SegmentDetector.java
		- [ ] Separation.java
		- [ ] SingleTypedFallbackCondition.java
		- [ ] TypedFallbackCondition.java
	- [ ] AbstractBounds.java
	- [ ] AbstractCollidable.java
	- [ ] AbstractCollisionBody.java
	- [ ] AbstractCollisionItem.java
	- [ ] AbstractCollisionPair.java
	- [ ] AxisAlignedBounds.java
	- [ ] BasicCollisionItem.java
	- [ ] BasicCollisionPair.java
	- [ ] Bounds.java
	- [ ] BoundsAdaptor.java
	- [ ] BoundsListener.java
	- [ ] CategoryFilter.java
	- [ ] Collidable.java
	- [ ] CollisionBody.java
	- [ ] CollisionItem.java
	- [ ] CollisionPair.java
	- [ ] Collisions.java	
	- [ ] Filter.java
	- [ ] Fixture.java
	- [ ] FixtureIterator.java	
	- [ ] TypeFilter.java
- [ ] dynamics
	- [ ] contact
		- [ ] Contact.java
		- [ ] ContactAdaptor.java
		- [ ] ContactConstraint.java
		- [ ] ContactConstraintId.java
		- [ ] ContactConstraintSolver.java
		- [ ] ContactListener.java
		- [ ] ContactManager.java
		- [ ] ContactPoint.java
		- [ ] ContactPointId.java
		- [ ] ContactUpdateHandler.java
		- [ ] DefaultContactManager.java
		- [ ] ForceCollisionTimeOfImpactSolver.java
		- [ ] PersistedContactPoint.java
		- [ ] SequentialImpulses.java
		- [ ] SimpleContactManager.java
		- [ ] SolvableContact.java
		- [ ] SolvedContact.java
		- [ ] SolvedContactPoint.java
		- [ ] TimeOfImpactSolver.java
		- [ ] WarmStartingContactManager.java
	- [ ] joint
		- [ ] AngleJoint.java
		- [ ] DistanceJoint.java
		- [ ] FrictionJoint.java
		- [ ] Joint.java
		- [ ] LimitState.java
		- [ ] MotorJoint.java
		- [ ] PinJoint.java
		- [ ] PrismaticJoint.java
		- [ ] PulleyJoint.java
		- [ ] RevoluteJoint.java
		- [ ] RopeJoint.java
		- [ ] WeldJoint.java
		- [ ] WheelJoint.java
	- [ ] AABBBroadphaseFilter.java
	- [ ] AbstractPhysicsBody.java
	- [ ] Body.java
	- [ ] BodyFixture.java
	- [ ] BodyIterator.java
	- [ ] Capacity.java
	- [ ] CoefficientMixer.java
	- [ ] CollisionAdaptor.java
	- [ ] CollisionListener.java
	- [ ] Constraint.java
	- [ ] ContactEdge.java
	- [ ] ContinuousDetectionMode.java
	- [ ] ConvexCastAdaptor.java
	- [ ] ConvexCastListener.java
	- [ ] ConvexCastResult.java
	- [ ] DestructionAdaptor.java
	- [ ] DestructionListener.java
	- [ ] DetectAdaptor.java
	- [ ] DetectBroadphaseFilter.java
	- [ ] DetectListener.java
	- [ ] DetectResult.java
	- [ ] Force.java
	- [ ] InteractionEdge.java
	- [ ] Island.java
	- [ ] JointEdge.java
	- [ ] JointIterator.java
	- [ ] PhysicsBody.java
	- [ ] RaycastAdaptor.java
	- [ ] RaycastBroadphaseFilter.java
	- [ ] RaycastListener.java
	- [ ] RaycastResult.java
	- [ ] Settings.java
	- [ ] Step.java
	- [ ] StepAdaptor.java
	- [ ] StepListener.java
	- [ ] TimeOfImpactAdaptor.java
	- [ ] TimeOfImpactListener.java
	- [ ] Torque.java
	- [ ] World.java
- [ ] geometry
	- [ ] decompose
		- [ ] Bayazit.java
		- [ ] ClosestEdgeToVertexSearchCriteria.java
		- [ ] Decomposer.java
		- [ ] DoubleEdgeList.java
		- [ ] DoubleEdgeListFace.java
		- [ ] DoubleEdgeListHalfEdge.java
		- [ ] DoubleEdgeListVertex.java
		- [ ] EarClipping.java
		- [ ] EarClippingVertex.java
		- [ ] MonotoneChainType.java
		- [ ] MonotonePolygon.java
		- [ ] MonotonePolygonType.java
		- [ ] MonotoneVertex.java
		- [ ] SweepLine.java
		- [ ] SweepLineEdge.java
		- [ ] SweepLineState.java
		- [ ] SweepLineVertex.java
		- [ ] SweepLineVertexType.java
		- [ ] Triangulator.java
	- [x] hull
		- [x] DivideAndConquer.java
		- [x] GiftWrap.java
		- [x] GrahamScan.java
		- [x] HullGenerator.java
		- [x] LinkedVertex.java
		- [x] LinkedVertexHull.java
		- [x] MinXYPointComparator.java
		- [x] MonotoneChain.java
		- [x] ReferencePointComparator.java
	- [x] AABB.java
	- [x] AbstractShape.java
	- [x] AdaptiveDecimal.java
	- [x] Capsule.java
	- [x] Circle.java
	- [x] Convex.java
	- [x] EdgeFeature.java
	- [x] Ellipse.java
	- [x] Feature.java
	- [x] Geometry.java
	- [x] HalfEllipse.java
	- [x] Interval.java
	- [x] Link.java
	- [x] Mass.java
	- [x] MassType.java
	- [x] Matrix22.java
	- [x] Matrix33.java
	- [x] PointFeature.java
	- [x] Polygon.java
	- [x] Ray.java
	- [x] Rectangle.java
	- [x] RobustGeometry.java
	- [x] Rotatable.java
	- [x] Rotation.java
	- [x] Segment.java
	- [x] Shape.java
	- [x] Shiftable.java
	- [x] Slice.java
	- [x] Transform.java
	- [x] Transformable.java
	- [x] Translatable.java
	- [x] Triangle.java
	- [x] Vector2.java
	- [x] Vector3.java
	- [x] Wound.java
	- [x] WoundIterator.java
- [ ] world
	- [ ] listener
		- [ ] BoundsListener.java
		- [ ] BoundsListenerAdaptor.java
		- [ ] CollisionListener.java
		- [ ] CollisionListenerAdaptor.java
		- [ ] ContactListener.java
		- [ ] ContactListenerAdaptor.java
		- [ ] DestructionListener.java
		- [ ] DestructionListenerAdaptor.java
		- [ ] StepListener.java
		- [ ] StepListenerAdaptor.java
		- [ ] TimeOfImpactListener.java
		- [ ] TimeOfImpactListenerAdaptor.java
		- [ ] WorldEventListener.java
	- [ ] result
		- [ ] ConvexCastResult.java
		- [ ] ConvexDetectResult.java
		- [ ] DetectResult.java
		- [ ] RaycaseResult.java
	- [ ] AbstractCollisionWorld.java
	- [ ] AbstractPhysicsWorld.java
	- [ ] BroadphaseCollisionData.java
	- [ ] BroadphaseFilter.java
	- [ ] BroadphaseFilterAdaptor.java
	- [ ] CoefficientMixer.java
	- [ ] CollisionBodyBroadphaseFilter.java
	- [ ] CollisionData.java
	- [ ] CollisionItemAdaptor.java
	- [ ] CollisionWorld.java
	- [ ] ConstraintGraph.java
	- [ ] ConstraintGraphNode.java
	- [ ] ContactCollisionData.java
	- [ ] DetectFilter.java
	- [ ] Island.java
	- [ ] ManifoldCollisionData.java
	- [ ] NarrowphaseCollisionData.java
	- [ ] PhysicsBodyBroadphaseFilter.java
	- [ ] PhysicsWorld.java
	- [ ] World.java
	- [ ] WorldCollisionData.java
- [ ] BinarySearchTree.java
- [ ] BinarySearchTreeIterator.java
- [ ] BinarySearchTreeNode.java
- [ ] BinarySearchTreeSearchCriteria.java
- [x] Copyable.java
- [x] DataContainer.java
- [x] Epsilon.java
- [ ] Listener.java
- [ ] Ownable.java
- [ ] Reference.java
- [ ] UnitConversion.java
- [ ] Version.java

## Tests To Port
- [ ] collision
	- [ ] broadphase
		- [ ] BroadphaseItemTest.java
		- [ ] BroadphasePairTest.java
		- [ ] BroadphaseTest.java
	- [ ] continuous
		- [ ] ConservativeAdvancementTest.java
	- [ ] manifold
		- [ ] ClippingManifoldSolverTest.java
		- [ ] IndexedManifoldPointIdTest.java
		- [ ] ManifoldPointIdTest.java
		- [ ] MainfoldPointTest.java
		- [ ] ManifoldTest.java
	- [ ] narrowphase
		- [ ] FallbackNarrowphaseDetectorTest.java
		- [ ] GkjRaycastTest.java
		- [ ] SegmentDetectorTest.java
	- [ ] shapes
		- [ ] AbstractNarrowphaseShapeTest.java
		- [ ] CapsuleCapsuleTest.java
		- [ ] CapsuleSliceTest.java
		- [ ] CircleCapsuleTest.java
		- [ ] CircleCircleTest.java
		- [ ] CircleEllipseTest.java
		- [ ] CircleHalfEllipseTest.java
		- [ ] CirclePolygonTest.java
		- [ ] CircleRectangleTest.java
		- [ ] CircleSegmentTest.java
		- [ ] CircleSliceTest.java
		- [ ] CircleTriangleTest.java
		- [ ] EllipseCapsuleTest.java
		- [ ] EllipseEllipseTest.java
		- [ ] EllipseHalfEllipseTest.java
		- [ ] EllipseSliceTest.java
		- [ ] HalfEllipseCapsuleTest.java
		- [ ] HalfEllipseHalfEllipseTest.java
		- [ ] HalfEllipseSliceTest.java
		- [ ] PolygonCapsuleTest.java
		- [ ] PolygonEllipseTest.java
		- [ ] PolygonHalfEllipseTest.java
		- [ ] PolygonPolygonTest.java
		- [ ] PolygonRectangleTest.java
		- [ ] PolygonSegmentTest.java
		- [ ] PolygonSliceTest.java
		- [ ] PolygonTriangleTest.java
		- [ ] RectangleCapsuleTest.java
		- [ ] RectangleEllipseTest.java
		- [ ] RectangleHalfEllipseTest.java
		- [ ] PolygonPolygonTest.java
		- [ ] PolygonRectangleTest.java
		- [ ] PolygonSegmentTest.java
		- [ ] PolygonSliceTest.java
		- [ ] PolygonTriangleTest.java
		- [ ] RectangleCapsuleTest.java
		- [ ] RectangleEllipseTest.java
		- [ ] RectangleHalfEllipseTest.java
		- [ ] RectangleRectangleTest.java
		- [ ] RectangleSegmentTest.java
		- [ ] RectangleSliceTest.java
		- [ ] RectangleTriangleTest.java
		- [ ] SegmentCapsuleTest.java
		- [ ] SegmentEllipseTest.java
		- [ ] SegmentHalfEllipseTest.java
		- [ ] SegmentSegmentTest.java
		- [ ] SegmentSliceTest.java
		- [ ] SegmentTriangleTest.java
		- [ ] SliceSliceTest.java
		- [ ] TriangleCapsuleTest.java
		- [ ] TriangleEllipseTest.java
		- [ ] TriangleHalfEllipseTest.java
		- [ ] TriangleSliceTest.java
		- [ ] TriangleTriangleTest.java 
	- [ ] AbstractBoundsTest.java
	- [ ] AbstractCollisionBodyTest.java
	- [ ] AbstractCollisionItemTest.java
	- [ ] AbstractCollisionPairTest.java
	- [ ] AxisAlignedBoundsTest.java
	- [ ] BasicCollisionItemTest.java
	- [ ] BasicCollisionPairTest.java
	- [ ] CategoryFilterTest.java
	- [ ] CollisionsTest.java
	- [ ] DefaultFilterTest.java
	- [ ] FixtureTest.java
	- [ ] TestCollisionBody.java
	- [ ] TypeFilterTest.java
- [ ] dynamics
	- [ ] contact
		- [ ] ContactConstraintIDTest.java
		- [ ] ContactConstraintTest.java
		- [ ] ContactManagerTest.java
	- [ ] joint
		- [ ] AbstractJointTest.java
		- [ ] AngleJointTest.java
		- [ ] DistanceJointTest.java
		- [ ] FrictionJointTest.java
		- [ ] MotorJointTest.java
		- [ ] PinJointTest.java
		- [ ] PrismaticJointTest.java
		- [ ] PulleyJointTest.java
		- [ ] RevoluteJointTest.java
		- [ ] RopeJointTest.java
		- [ ] WeldJointTest.java
		- [ ] WheelJointTest.java
	- [ ] AbstractPhysicsBodyTest.java
	- [ ] BodyFixtureTest.java
	- [ ] BodyTest.java
	- [ ] CapacityTest.java
	- [ ] ForceTest.java
	- [ ] IslandTest.java
	- [ ] SettingsTest.java
	- [ ] TimeStepTest.java
	- [ ] TorqueTest.java
	- [ ] WorldTest.java
- [ ] geometry
	- [ ] decompose
		- [ ] AbstractDecomposeTest.java
		- [ ] BayazitTest.java
		- [ ] EarClippingTest.java
		- [ ] SweepLineTest.java			
	- [ ] hull
		- [ ] DivideAndConquerTest.java
		- [x] GiftWrapTest.java
		- [x] GrahamScanTest.java	
		- [x] MonotoneChainTest.java			
	- [x] AABBTest.java
	- [x] AbstractShapeTest.java
	- [x] AdaptiveDecimalTest.java
	- [x] CapsuleTest.java
	- [x] CircleTest.java
	- [x] EllipseTest.java
	- [x] GeometryTest.java
	- [x] HalfEllipseTest.java
	- [x] IntervalTest.java
	- [x] MassTest.java
	- [x] Matrix22Test.java
	- [x] Matrix33Test.java
	- [x] PolygonTest.java
	- [x] RayTest.java
	- [x] RectangleTest.java
	- [x] RobustGeometryTest.java
	- [x] RotationTest.java
	- [x] SegmentTest.java
	- [x] SliceTest.java
	- [x] TransformTest.java
	- [x] TriangleTest.java
	- [x] Vector2Test.java
	- [x] Vector3Test.java
	- [x] WoundTest.java
- [ ] simulation
	- [ ] DistanceJointSimulationtest.java
	- [ ] ForceSimulationTest.java
	- [ ] FrictionJointSimulationTest.java
	- [ ] PinJointSimulationtest.java
	- [ ] TorquaSimulationTest.java
- [ ] world
	- [ ] listener
		- [ ] ListenerAdaptersTest.java
	- [ ] result
		- [ ] DetectResultTest.java
	- [ ] AbstractCollisionWorldTest.java
	- [ ] AbstractPhysicsWorldTest.java
	- [ ] BroadphaseFilterAdaptorTest.java
	- [ ] CoefficientMixerTest.java
	- [ ] CollisionBodyBroadphaseFilterTest.java
	- [ ] CollisionItemAdaptorTest.java
	- [ ] ConstraintGraphTest.java
	- [ ] DetectFilterTest.java
	- [ ] IslandTest.java
	- [ ] PhysicsBodyBroadphaseFilterTest.java
	- [ ] WorldTest.java
- [ ] BalancedBinarySearchTreeTest.java
- [ ] BinarySearchTreeTest.java
- [x] EpsilonTest.java
- [ ] InconsistentElementType.java
- [ ] MessagesTest.java
- [ ] ReferenceTest.java
- [ ] UnitConversionTest.java
- [ ] VersionTest.java

[dyn4j]: https://github.com/dyn4j/dyn4j
