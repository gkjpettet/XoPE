#tag Class
Protected Class PolygonTests
Inherits TestGroup
	#tag Event
		Sub Setup()
		  Prop2 = Prop2 + 1
		  
		  IDENTITY = New PhysicsKit.Transform
		End Sub
	#tag EndEvent

	#tag Event
		Sub TearDown()
		  Prop2 = Prop2 - 1
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(err As RuntimeException, methodName As Text) As Boolean
		  #pragma unused err
		  
		  Const kMethodName As Text = "UnhandledException"
		  
		  If methodName.Length >= kMethodName.Length And methodName.Left(kMethodName.Length) = kMethodName Then
		    Assert.Pass("Exception was handled")
		    Return True
		  End If
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ContainsPointCoIncidentMidTest()
		  ///
		  ' Tests the Contains method against a point that is coincident with
		  ' the starting edge of the polygon.
		  ///
		  
		  Using PhysicsKit
		  
		  Var vertices() As Vector2 = Array( _
		  New Vector2(0.0, 4.0), _
		  New Vector2(0.0, 2.0), _
		  New Vector2(2.0, 0.0), _
		  New Vector2(4.0, 0.0), _
		  New Vector2(7.0, 3.0), _
		  New Vector2(7.0, 5.0), _
		  New Vector2(5.0, 7.0), _
		  New Vector2(3.0, 7.0))
		  Var p As Polygon = New Polygon(vertices)
		  
		  Assert.IsFalse(p.Contains(New Vector2(0.0, 0.0)))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContainsPointCoIncidentStartTest()
		  ///
		  ' Tests the Contains methods against a point that is coincident with 
		  ' the starting edge of the polygon.
		  ///
		  
		  Using PhysicsKit
		  
		  Var vertices() As Vector2 = Array( _
		  New Vector2(2.0, 0.0), _
		  New Vector2(4.0, 0.0), _
		  New Vector2(7.0, 3.0), _
		  New Vector2(7.0, 5.0), _
		  New Vector2(5.0, 7.0), _
		  New Vector2(3.0, 7.0), _
		  New Vector2(0.0, 4.0), _
		  New Vector2(0.0, 2.0))
		  Var p As Polygon = New Polygon(vertices)
		  
		  Assert.IsFalse(p.Contains(New Vector2(0.0, 0.0)))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContainsPointCoIncidentWithCoincidentEdges2Test()
		  ///
		  ' Tests the Contains method against a point that is coincident with
		  ' the starting edge of a polygon that has two coincident edges.
		  ///
		  
		  Using PhysicsKit
		  
		  Var vertices() As Vector2 = Array( _
		  New Vector2(2.0, 0.0), _
		  New Vector2(4.0, 0.0), _
		  New Vector2(5.0, 0.0), _
		  New Vector2(7.0, 3.0), _
		  New Vector2(7.0, 5.0), _
		  New Vector2(5.0, 7.0), _
		  New Vector2(3.0, 7.0), _
		  New Vector2(0.0, 4.0), _
		  New Vector2(0.0, 2.0))
		  Var p As Polygon = New Polygon(vertices)
		  
		  Assert.IsTrue(p.Contains(New Vector2(4.5, 0.0)))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContainsPointCoIncidentWithCoincidentEdgesTest()
		  ///
		  ' Tests the Contains method against a point that is coincident with
		  ' the starting edge of a polygon that has two coincident edges.
		  ///
		  
		  Using PhysicsKit
		  
		  Var vertices() As Vector2 = Array( _
		  New Vector2(2.0, 0.0), _
		  New Vector2(4.0, 0.0), _
		  New Vector2(5.0, 0.0), _
		  New Vector2(7.0, 3.0), _
		  New Vector2(7.0, 5.0), _
		  New Vector2(5.0, 7.0), _
		  New Vector2(3.0, 7.0), _
		  New Vector2(0.0, 4.0), _
		  New Vector2(0.0, 2.0))
		  Var p As Polygon = New Polygon(vertices)
		  
		  Assert.IsFalse(p.Contains(New Vector2(0.0, 0.0)))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContainsTest()
		  ///
		  ' Tests the Contains method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var vertices() As Vector2 = Array(_
		  New Vector2(0.0, 1.0), _
		  New Vector2(-1.0, 0.0), _
		  New Vector2(1.0, 0.0))
		  
		  Var p As Polygon = New Polygon(vertices)
		  
		  Var t As Transform = New Transform
		  Var pt As Vector2 = New Vector2(2.0, 4.0)
		  
		  // Shouldn't be in the polygon.
		  Assert.IsTrue(Not p.Contains(pt, t))
		  
		  // Move the polygon a bit.
		  t.Translate(2.0, 3.5)
		  
		  // Should be in the polygon.
		  Assert.IsTrue(p.Contains(pt, t))
		  
		  t.Translate(0.0, -0.5)
		  
		  // Should be on a vertex.
		  Assert.IsTrue(p.Contains(pt, t))
		  
		  t.Translate(0.5, 0.5)
		  
		  // Should be on an edge.
		  Assert.IsTrue(p.Contains(pt, t))
		  
		  t.Translate(-1.0, -1.0)
		  
		  // Should be outside, but colinear.
		  Assert.IsFalse(p.Contains(pt, t))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateAABBTest()
		  ///
		  ' Tests the CreateAABB method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var vertices() As Vector2 = Array(New Vector2(0.0, 1.0), _
		  New Vector2(-1.0, -1.0), New Vector2(1.0, -1.0))
		  Var p As Polygon = New Polygon(vertices)
		  
		  Var aabb As AABB = p.CreateAABB(IDENTITY)
		  Assert.AreEqual(-1.0, aabb.GetMinX, 1.0e-3)
		  Assert.AreEqual(-1.0, aabb.GetMinY, 1.0e-3)
		  Assert.AreEqual( 1.0, aabb.GetMaxX, 1.0e-3)
		  Assert.AreEqual( 1.0, aabb.GetMaxY, 1.0e-3)
		  
		  // Try using the default method.
		  Var aabb2 As AABB = p.CreateAABB
		  Assert.AreEqual(aabb.GetMinX, aabb2.GetMinX)
		  Assert.AreEqual(aabb.GetMinY, aabb2.GetMinY)
		  Assert.AreEqual(aabb.GetMaxX, aabb2.GetMaxX)
		  Assert.AreEqual(aabb.GetMaxY, aabb2.GetMaxY)
		  
		  Var tx As Transform = New Transform
		  tx.Rotate(MathsKit.ToRadians(30.0))
		  tx.Translate(1.0, 2.0)
		  aabb = p.CreateAABB(tx)
		  Assert.AreEqual( 0.500, aabb.GetMinX, 1.0e-3)
		  Assert.AreEqual( 0.634, aabb.GetMinY, 1.0e-3)
		  Assert.AreEqual( 2.366, aabb.GetMaxX, 1.0e-3)
		  Assert.AreEqual( 2.866, aabb.GetMaxY, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateCCWTest()
		  ///
		  ' Tests that the triangle is CCW.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var p As Polygon = New Polygon(Array(New Vector2(0.5, 0.5), New Vector2(-0.3, -0.5), _
		    New Vector2(1.0, -0.3)))
		    #Pragma Unused p
		  Catch e As RuntimeException
		    Assert.Fail("Unexpected constructor failure.")
		    Return
		  End Try
		  
		  Assert.Pass
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateCoincidentTest()
		  ///
		  ' Tests coincident points.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var p As Polygon = New Polygon(Array(New Vector2, New Vector2(2.0, 2.0), _
		    New Vector2(2.0, 2.0), New Vector2(1.0, 0.0)))
		    #Pragma Unused p
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException as points coincident.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateDegenerateTest()
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var p As Polygon = New Polygon(Array(New Vector2(1.0, 0.0), New Vector2(2.0, 0.0), _
		    New Vector2(1.0, 0.0)))
		    #Pragma Unused p
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException as degenerate constructor.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNilPointTest()
		  ///
		  ' Tests an array with Nil points.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var p As Polygon = New Polygon(Array(New Vector2, Nil, New Vector2(0, 2)))
		    #Pragma Unused p
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected NilObjectException as passed Nil point to constructor.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNonConvexTest()
		  ///
		  ' Tests non-convex points.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var p As Polygon = New Polygon(Array(New Vector2(1.0, 1.0), New Vector2(-1.0, 1.0), _
		    New Vector2(-0.5, 0.0), New Vector2(-1.0, -1.0), New Vector2(1.0, -1.0)))
		    #Pragma Unused p
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException as points are non-convex")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNotCCWTest()
		  ///
		  ' Tests not CCW.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var p As Polygon = New Polygon(Array(New Vector2, New Vector2(2.0, 2.0), New Vector2(1.0, 0.0)))
		    #Pragma Unused p
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException as vertices not CCW")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateNotEnoughPointsTest()
		  ///
		  ' Tests not enough points.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var p As Polygon = New Polygon(Array(New Vector2, New Vector2))
		    #Pragma Unused p
		  Catch e As InvalidArgumentException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected InvalidArgumentException as not enough points passed to constructor.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSuccessTest()
		  ///
		  ' Tests the constructor.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var p As polygon = New Polygon(Array(New Vector2(0.0, 1.0), New Vector2(-2.0, -2.0), _
		    New Vector2(1.0, -2.0)))
		    #Pragma Unused p
		  Catch e As RuntimeException
		    Assert.Fail("Constructor failed but should have passed.")
		    Return
		  End Try
		  
		  Assert.Pass
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAxesTest()
		  ///
		  ' Tests the GetAxes method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var vertices() As Vector2 = Array(New Vector2(0.0, 1.0), _
		  New Vector2(-1.0, -1.0), New Vector2(1.0, -1.0))
		  
		  Var p As Polygon = New Polygon(vertices)
		  Var t As Transform = New Transform
		  
		  Var axes() As Vector2 = p.GetAxes(Nil, t)
		  Assert.IsFalse(axes = Nil)
		  Var axesCount As Integer = axes.Count
		  Assert.AreEqual(3, axesCount)
		  
		  // Test passing some focal points.
		  Var pt As Vector2 = New Vector2(-3.0, 2.0)
		  axes = p.GetAxes(Array(pt), t)
		  axesCount = axes.Count
		  Assert.AreEqual(4, axesCount)
		  
		  // Make sure the axes are perpendicular to the edges.
		  Var ab As Vector2 = p.Vertices(0).Towards(p.Vertices(1))
		  Var bc As Vector2 = p.Vertices(1).Towards(p.Vertices(2))
		  Var ca As Vector2 = p.Vertices(2).Towards(p.Vertices(0))
		  
		  Assert.AreEqual(0.000, ab.Dot(axes(0)), 1.0e-3)
		  Assert.AreEqual(0.000, bc.Dot(axes(1)), 1.0e-3)
		  Assert.AreEqual(0.000, ca.Dot(axes(2)), 1.0e-3)
		  
		  // Make sure that the focal axes are correct.
		  Assert.AreEqual(0.000, p.Vertices(0).Towards(pt).Cross(axes(3)), 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFarthestTest()
		  ///
		  ' Tests the farthest methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var vertices() As Vector2 = Array(_
		  New Vector2(0.0, 1.0), _
		  New Vector2(-1.0, -1.0), _
		  New Vector2(1.0, -1.0))
		  
		  Var p As Polygon = New Polygon(vertices)
		  Var t As Transform = New Transform
		  Var y As Vector2 = New Vector2(0.0, -1.0)
		  
		  Var f As PhysicsKit.EdgeFeature = p.GetFarthestFeature(y, t)
		  
		  // Should always get an edge.
		  Assert.AreEqual(-1.000, f.Max.Point.x, 1.0e-3, "1")
		  Assert.AreEqual(-1.000, f.Max.Point.y, 1.0e-3, "2")
		  Assert.AreEqual(-1.000, f.Vertex1.Point.x, 1.0e-3, "3")
		  Assert.AreEqual(-1.000, f.Vertex1.Point.y, 1.0e-3, "4")
		  Assert.AreEqual( 1.000, f.Vertex2.Point.x, 1.0e-3, "5")
		  Assert.AreEqual(-1.000, f.Vertex2.Point.y, 1.0e-3, "6")
		  
		  Var pt As Vector2 = p.GetFarthestPoint(y, t)
		  
		  Assert.AreEqual(-1.000, pt.x, 1.0e-3, "7")
		  Assert.AreEqual(-1.000, pt.y, 1.0e-3, "8")
		  
		  // Rotating about the origin.
		  t.Rotate(MathsKit.ToRadians(90), 0, 0)
		  
		  pt = p.GetFarthestPoint(y, t)
		  
		  Assert.AreEqual( 1.000, pt.x, 1.0e-3, "9")
		  Assert.AreEqual(-1.000, pt.y, 1.0e-3, "10")
		  
		  
		  // 1: Expected [-1] but was [1].
		  // 7: Expected [-1] but was [1].
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFociTest()
		  ///
		  ' Tests the GetFoci method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var vertices() As Vector2 = Array(New Vector2(0.0, 1.0), New Vector2(-1.0, -1.0), _
		  New Vector2(1.0, -1.0))
		  
		  Var p As Polygon = New Polygon(vertices)
		  Var t As Transform = New Transform
		  
		  // Should return Nil.
		  Var foci() As Vector2 = p.GetFoci(t)
		  Assert.IsTrue(foci = Nil)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NilPointArrayTest()
		  ///
		  ' Tests Nil point array.
		  ///
		  
		  Using PhysicsKit
		  
		  #Pragma BreakOnExceptions False
		  
		  Try
		    Var p As polygon = New Polygon(Nil)
		    #Pragma Unused p
		  Catch e As NilObjectException
		    Assert.Pass
		    Return
		  End Try
		  
		  Assert.Fail("Expected NilObjectException as constructor passed Nil as array.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProjectTest()
		  ///
		  ' Tests the Project method.
		  ///
		  
		  Using PhysicsKit
		  
		  Var vertices() As Vector2 = Array(_
		  New Vector2(0.0, 1.0), _
		  New Vector2(-1.0, 0.0), _
		  New Vector2(1.0, 0.0))
		  
		  Var p As Polygon = New Polygon(vertices)
		  Var t As Transform = New Transform
		  Var x As Vector2 = New Vector2(1.0, 0.0)
		  Var y As Vector2 = New Vector2(0.0, 1.0)
		  
		  t.Translate(1.0, 0.5)
		  
		  Var i As Interval = p.Project(x, t)
		  
		  Assert.AreEqual(0.000, i.min, 1.0e-3)
		  Assert.AreEqual(2.000, i.max, 1.0e-3)
		  
		  // Rotating about the centre.
		  t.Rotate(MathsKit.ToRadians(90), 1.0, 0.5)
		  
		  i = p.Project(y, t)
		  
		  Assert.AreEqual(-0.500, i.min, 1.0e-3)
		  Assert.AreEqual(1.500, i.max, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateTest()
		  ///
		  ' Tests the Rotate methods.
		  //
		  
		  Using PhysicsKit
		  
		  Var vertices() As Vector2 = Array(New Vector2(0.0, 1.0), _
		  New Vector2(-1.0, -1.0), New Vector2(1.0, -1.0))
		  Var p As Polygon = New Polygon(vertices)
		  
		  // Should move the points.
		  p.Rotate(MathsKit.ToRadians(90), 0, 0)
		  
		  Assert.AreEqual(-1.000, p.Vertices(0).x, 1.0e-3)
		  Assert.AreEqual( 0.000, p.Vertices(0).y, 1.0e-3)
		  
		  Assert.AreEqual( 1.000, p.Vertices(1).x, 1.0e-3)
		  Assert.AreEqual(-1.000, p.Vertices(1).y, 1.0e-3)
		  
		  Assert.AreEqual( 1.000, p.Vertices(2).x, 1.0e-3)
		  Assert.AreEqual( 1.000, p.Vertices(2).y, 1.0e-3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TranslateTest()
		  ///
		  ' Tests the Translate methods.
		  ///
		  
		  Using PhysicsKit
		  
		  Var vertices() As Vector2 = Array(New Vector2(0.0, 1.0), _
		  New Vector2(-1.0, -1.0), New Vector2(1.0, -1.0))
		  Var p As Polygon = New Polygon(vertices)
		  
		  p.Translate(1.0, -0.5)
		  
		  Assert.AreEqual( 1.000, p.Vertices(0).x, 1.0e-3)
		  Assert.AreEqual( 0.500, p.Vertices(0).y, 1.0e-3)
		  
		  Assert.AreEqual( 0.000, p.Vertices(1).x, 1.0e-3)
		  Assert.AreEqual(-1.500, p.Vertices(1).y, 1.0e-3)
		  
		  Assert.AreEqual( 2.000, p.Vertices(2).x, 1.0e-3)
		  Assert.AreEqual(-1.500, p.Vertices(2).y, 1.0e-3)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private IDENTITY As PhysicsKit.Transform
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Prop1 As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Prop2 As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Duration"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FailedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IncludeGroup"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRunning"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NotImplementedCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PassedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SkippedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StopTestOnFail"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass