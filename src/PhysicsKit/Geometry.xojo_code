#tag Class
Protected Class Geometry
	#tag Method, Flags = &h0, Description = 437265617465732061206E65772043617073756C6520626F756E6465642062792074686520676976656E2072656374616E676C6520776964746820616E64206865696768742E205468652063617073756C652077696C6C20626520617869732D616C69676E656420616E642063656E7465726564206F6E20746865206F726967696E2077697468207468652063617073206F6E2074686520656E6473206F6620746865206C6172676573742064696D656E73696F6E2E
		Shared Function CreateCapsule(width As Double, height As Double) As PhysicsKit.Capsule
		  ///
		  ' Creates a new Capsule bounded by the given rectangle width and height.
		  '
		  ' The capsule will be axis-aligned and centered on the origin with the caps on the
		  ' ends of the largest dimension.
		  '
		  ' If width and height are equal use a Circle shape instead.
		  '
		  ' - Parameter width: The bounding rectangle width.
		  ' - Parameter height: The bounding rectangle height.
		  '
		  ' - Returns: A new Capsule.
		  '
		  ' - Raises: InvalidArgumentException if `width` or `height` are less than or equal to zero.
		  ///
		  
		  Return New Capsule(width, height)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E657720436972636C6520776974682074686520676976656E207261646975732063656E7465726564206F6E20746865206F726967696E2E205468726F777320496E76616C6964417267756D656E74457863657074696F6E2E
		Shared Function CreateCircle(radius As Double) As PhysicsKit.Circle
		  ///
		  ' Returns a new Circle with the given radius centered on the origin.
		  '
		  ' - Parameter radius: The radius in metres.
		  '
		  ' - Returns: A new Circle instance.'
		  ' 
		  ' - Raises: InvalidArgumentException if radius is less than or equal to zero.
		  ///
		  
		  Return New Circle(radius)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4372656174657320616E20657175696C61746572616C20547269616E676C652077697468207468652063656E74726520617420746865206F726967696E2E2052616973657320496E76616C6964417267756D656E74457863657074696F6E2E
		Shared Function CreateEquilateralTriangle(height As Double) As PhysicsKit.Triangle
		  ///
		  ' Creates an equilateral Triangle with the centre at the origin.
		  '
		  ' - Parameter height: The height of the triangle in metres.
		  '
		  ' - Returns: A new Triangle.
		  '
		  ' - Raises: InvalidArgumentException if height is less than or equal to zero.
		  ///
		  
		  // Check the size.
		  If height <= 0.0 Then Raise New InvalidArgumentException(Messages.GEOMETRY_INVALID_SIZE)
		  
		  // Compute `a` where height = a * sqrt(3) / 2.0 (a is the width of the base).
		  Var a As Double = 2.0 * height * INV_SQRT_3
		  
		  // Create the triangle.
		  Return Geometry.CreateIsoscelesTriangle(a, height)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E6577205365676D656E7420776974682074686520676976656E206C656E6774682077697468207468652063656E74726520617420746865206F726967696E2E2052616973657320496E76616C6964417267756D656E74457863657074696F6E2E
		Shared Function CreateHorizontalSegment(length As Double) As PhysicsKit.Segment
		  ///
		  ' Creates a new Segment with the given length with the centre at the origin.
		  '
		  ' - Parameter length: The length of the segment in metres.
		  '
		  ' - Returns: A new Segment.
		  '
		  ' - Raises: InvalidArgumentException if length is less than or equal to zero.
		  ///
		  
		  // Check the length.
		  If length <= 0.0 Then Raise New InvalidArgumentException(Messages.GEOMETRY_INVALID_LENGTH)
		  
		  Var startV As Vector2 = New Vector2(-length * 0.5, 0.0)
		  Var endV As Vector2 = New Vector2(length * 0.5, 0.0)
		  
		  Return New Segment(startV, endV)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4372656174657320616E2069736F7363656C657320547269616E676C652077697468207468652063656E74726520617420746865206F726967696E2E2052616973657320496E76616C6964417267756D656E74457863657074696F6E2E
		Shared Function CreateIsoscelesTriangle(width As Double, height As Double) As PhysicsKit.Triangle
		  ///
		  ' Creates an isosceles Triangle with the centre at the origin.
		  '
		  ' - Parameter width: The width of the base in metres.
		  ' - Parameter height: The height in metres.
		  '
		  ' - Returns: A new Triangle.
		  '
		  ' - Raises: InvalidArgumentException if width or height is less than or equal to zero.
		  ///
		  
		  // Check the width.
		  If width <= 0.0 Then Raise New InvalidArgumentException(Messages.GEOMETRY_INVALID_WIDTH)
		  
		  // Check the height.
		  If height <= 0.0 Then Raise New InvalidArgumentException(Messages.GEOMETRY_INVALID_HEIGHT)
		  
		  Var top As Vector2 = New Vector2(0.0, height)
		  Var left As Vector2 = New Vector2(-width * 0.5, 0.0)
		  Var right As Vector2 = New Vector2(width * 0.5, 0.0)
		  
		  // Create the triangle
		  Var t As Triangle = New Triangle(top, left, right)
		  Var center As Vector2 = t.GetCenter
		  t.Translate(-center.X, -center.Y)
		  
		  Return t
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreatePolygon(vertices() As PhysicsKit.Vector2) As PhysicsKit.Polygon
		  ///
		  ' Returns a new Polygon with the given vertices.
		  '
		  ' This method makes a copy of both the array and the vertices within the array to 
		  ' create the new Polygon.
		  '
		  ' The centre of the Polygon will be computed using the area weighted method.
		  '
		  ' - Parameter vertices: The array of vertices.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: NilObjectException if `vertices` is Nil or an element of `vertices` is Nil.
		  ' - Raises: InvalidArgumentException if `vertices` contains less than 3 non-Nil vertices.
		  ///
		  
		  // Check the vertices array.
		  If vertices = Nil Then Raise New NilObjectException(Messages.GEOMETRY_NIL_VERTICES_ARRAY)
		  
		  // Loop over the points and copy them.
		  Var verts() As Vector2
		  For Each vertex As Vector2 In vertices
		    // Check for Nil points.
		    If vertex <> Nil Then
		      verts.AddRow(vertex.Copy)
		    Else
		      Raise New NilObjectException(Messages.GEOMETRY_NIL_POLYGON_POINT)
		    End If
		  Next vertex
		  
		  Return New Polygon(verts)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720506F6C79676F6E20696E20746865207368617065206F66206120636972636C65207769746820636F756E74206E756D626572206F662076657274696365732063656E7465726564206F6E20746865206F726967696E2E
		Shared Function CreatePolygonalCircle(count As Integer, radius As Double) As PhysicsKit.Polygon
		  ///
		  ' Creates a new Polygon in the shape of a circle with count number of vertices centered
		  ' on the origin.
		  '
		  ' - Parameter count: The number of vertices to use. Must be greater than 2.
		  ' - Parameter radius: The radius of the circle. Must be greater than zero.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: InvalidArgumentException if `count` < 3 or `radius` <= 0.
		  ///
		  
		  Return Geometry.CreatePolygonalCircle(count, radius, 0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720506F6C79676F6E20696E20746865207368617065206F66206120636972636C65207769746820636F756E74206E756D626572206F662076657274696365732063656E7465726564206F6E20746865206F726967696E2E
		Shared Function CreatePolygonalCircle(count As Integer, radius As Double, theta As Double) As PhysicsKit.Polygon
		  ///
		  ' Creates a new Polygon in the shape of a circle with count number of vertices centered
		  ' on the origin.
		  '
		  ' - Parameter count: The number of vertices to use. Must be greater than or equal to 3.
		  ' - Parameter radius: The radius of the circle. Must be greater than zero.
		  ' - Parameter theta: The radial offset for the points in radians.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: InvalidArgumentException if `count` < 3 or `radius` <= 0.
		  ///
		  
		  // Validate the input.
		  If count < 3 Then Raise New InvalidArgumentException(Messages.GEOMETRY_CIRCLE_INVALID_COUNT)
		  If radius <= 0.0 Then Raise New InvalidArgumentException(Messages.GEOMETRY_CIRCLE_INVALID_RADIUS)
		  
		  // Compute the angular increment.
		  Var pin As Double = Geometry.TWO_PI / count
		  
		  // Make sure the resulting output is an even number of vertices.
		  Var vertices() As Vector2
		  vertices.ResizeTo(count - 1)
		  
		  Var c As Double = Cos(pin)
		  Var s As Double = Sin(pin)
		  Var t As Double = 0
		  
		  Var x As Double = radius
		  Var y As Double = 0
		  
		  // Initialise at theta if necessary.
		  If theta <> 0 Then
		    x = radius * Cos(theta)
		    y = radius * Sin(theta)
		  End If
		  
		  Var iLimit As Integer = vertices.LastRowIndex
		  For i As Integer = 0 To iLimit
		    vertices(i) = New Vector2(x, y)
		    
		    // Apply the rotation matrix.
		    t = x
		    x = c * x - s * y
		    y = s * t + c * y
		  Next i
		  
		  Return New Polygon(vertices)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E657720506F6C79676F6E2C207573696E672074686520676976656E2076657274696365732C2063656E746572656420617420746865206F726967696E2E204D616B6573206120636F7079206F662074686520617272617920616E64207468652076657274696365732077697468696E2074686520617272617920746F2063726561746520746865206E657720506F6C79676F6E2E207468726F7773204E696C4F626A656374457863657074696F6E7320616E6420496E76616C6964417267756D656E74457863657074696F6E732E
		Shared Function CreatePolygonAtOrigin(ParamArray vertices As PhysicsKit.Vector2) As PhysicsKit.Polygon
		  ///
		  ' Returns a new Polygon, using the given vertices, centered at the origin.
		  '
		  ' This method makes a copy of both the array and the vertices within the array to 
		  ' create the new Polygon.
		  '
		  ' This method translates the Polygon vertices so that the centre is at the origin.
		  '
		  ' - Parameter vertices: The array of vertices.
		  '
		  ' - Returns: A new Polygon.'
		  ' - Raises: NilObjectException if `vertices` is Nil or an element of vertices is Nil.
		  ' - Raises InvalidArgumentException if `vertices` contains less than 3 non-Nill vertices.
		  ///
		  
		  Var p As Polygon = Geometry.CreatePolygon(vertices)
		  Var center As Vector2 = p.GetCenter
		  p.Translate(-center.X, -center.Y)
		  
		  Return p
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E65772052656374616E676C6520776974682074686520676976656E20776964746820286D2920616E642068656967687420286D292C202063656E746572656420617420746865206F726967696E2E
		Shared Function CreateRectangle(width As Double, height As Double) As PhysicsKit.Rectangle
		  ///
		  ' Creates a new Rectangle with the given width and height centered at the origin.
		  '
		  ' - Parameter width: The width in metres.
		  ' - Parameter height: The height in metres.
		  '
		  ' - Returns: Rectangle.'
		  ' - Raises: InvalidArgumentException if width or height is less than or equal to zero.
		  ///
		  
		  Return New Rectangle(width, height)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 43726561746573206120726967687420616E676C6520547269616E676C652077697468207468652063656E74726520617420746865206F726967696E2E206077696474686020616E642060686569676874602061726520696E206D65747265732E2052616973657320496E76616C6964417267756D656E74457863657074696F6E732E
		Shared Function CreateRightTriangle(width As Double, height As Double) As PhysicsKit.Triangle
		  ///
		  ' Creates a right angle Triangle with the centre at the origin.
		  '
		  ' - Parameter width: The width of the base in metres.
		  ' - Parameter height: The height in metres.
		  '
		  ' - Returns: A new Triangle.
		  ' - Raises: InvalidArgumentException if `width` or `height` is less than or equal to zero.
		  ///
		  
		  Return Geometry.CreateRightTriangle(width, height, False)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 43726561746573206120726967687420616E676C6520547269616E676C652077697468207468652063656E74726520617420746865206F726967696E2E206077696474686020616E642060686569676874602061726520696E206D65747265732E2052616973657320496E76616C6964417267756D656E74457863657074696F6E732E
		Shared Function CreateRightTriangle(width As Double, height As Double, mirror As Boolean) As PhysicsKit.Triangle
		  ///
		  ' Creates a right angle Triangle with the centre at the origin.
		  '
		  ' - Parameter width: The width of the base in metres.
		  ' - Parameter height: The height in metres.
		  ' - Parameter mirror: True if the triangle should be mirrored along the y-axis.
		  '
		  ' - Returns: A new Triangle.
		  ' - Raises: InvalidArgumentException if `width` or `height` is less than or equal to zero.
		  ///
		  
		  // Check the width.
		  If width <= 0.0 Then Raise New InvalidArgumentException(Messages.GEOMETRY_INVALID_WIDTH)
		  
		  // Check the height.
		  If height <= 0.0 Then Raise New InvalidArgumentException(Messages.GEOMETRY_INVALID_HEIGHT)
		  
		  Var top As Vector2 = New Vector2(0.0, height)
		  Var left As Vector2 = New Vector2(0.0, 0.0)
		  Var right As Vector2 = New Vector2(If(mirror, -width, width), 0.0)
		  
		  Var t As Triangle
		  If mirror Then
		    // Make sure it has anti-clockwise winding.
		    t = New Triangle(top, right, left)
		  Else
		    t = New Triangle(top, left, right)
		  End If
		  
		  Var center As Vector2 = t.GetCenter
		  t.Translate(-center.X, -center.Y)
		  
		  Return t
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E6577205365676D656E742066726F6D20746865206F726967696E20746F2074686520676976656E20656E6420706F696E742E204D616B6573206120636F7079206F662074686520676976656E20706F696E7420746F2063726561746520746865205365676D656E742E20526169736573204E696C4F626A656374457863657074696F6E732E
		Shared Function CreateSegment(endPoint As PhysicsKit.Vector2) As PhysicsKit.Segment
		  ///
		  ' Creates a new Segment from the origin to the given end point
		  '
		  ' This method makes a copy of the given point to create the Segment.
		  '
		  ' - Parameter endPoint: The end point.
		  '
		  ' - Returns: A new Segment.
		  '
		  ' - Raises: NilObjectException if `endPoint` is Nil.
		  ///
		  
		  Return Geometry.CreateSegment(New Vector2, endPoint)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E6577205365676D656E7420776974682074686520676976656E20706F696E74732E204D616B6573206120636F7079206F662074686520676976656E20706F696E747320746F2063726561746520746865205365676D656E742E205468652063656E747265206F6620746865205365676D656E742077696C6C206265207468652061766572616765206F66207468652074776F20706F696E74732E20526169736573204E696C4F626A656374457863657074696F6E732E
		Shared Function CreateSegment(p1 As PhysicsKit.Vector2, p2 As PhysicsKit.Vector2) As PhysicsKit.Segment
		  ///
		  ' Creates a new Segment with the given points.
		  '
		  ' This method makes a copy of the given points to create the Segment.
		  '
		  ' The centre of the Segment will be the average of the two points.
		  '
		  ' - Parameter p1: The first point.
		  ' - Parameter p2: The second point.
		  '
		  ' - Returns: A new Segment.
		  '
		  ' - Raises: NilObjectException if `p1` or `p2` is Nil.
		  ///
		  
		  If p1 Is Nil Or p2 Is Nil Then Raise New NilObjectException(Messages.GEOMETRY_NIL_SEGMENT_POINT)
		  
		  Return New Segment(p1.Copy, p2.Copy)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E6577205365676D656E7420776974682074686520676976656E20706F696E74732E204D616B6573206120636F7079206F662074686520676976656E20706F696E747320746F2063726561746520746865205365676D656E742E20547472616E736C6174657320746865205365676D656E7420766572746963657320736F2074686174207468652063656E74726520697320617420746865206F726967696E2E20526169736573204E696C4F626A656374457863657074696F6E732E
		Shared Function CreateSegmentAtOrigin(p1 As PhysicsKit.Vector2, p2 As PhysicsKit.Vector2) As PhysicsKit.Segment
		  ///
		  ' Creates a new Segment with the given points.
		  '
		  ' This method makes a copy of the given points to create the Segment.
		  '
		  ' This method translates the Segment vertices so that the centre is at the origin.
		  '
		  ' - Parameter p1: The first point.
		  ' - Parameter p2: The second point.
		  '
		  ' - Returns: A new Segment.
		  '
		  ' - Raises: NilObjectException if `p1` or `p2` is Nil.
		  ///
		  
		  Var s As Segment = Geometry.createSegment(p1, p2)
		  Var center As Vector2 = s.GetCenter
		  s.Translate(-center.X, -center.Y)
		  
		  Return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4372656174657320612073717561726520776974682074686520676976656E2073697A652028696E206D6574726573292C2063656E746572656420617420746865206F726967696E2E205468726F777320496E76616C6964417267756D656E74457863657074696F6E2E
		Shared Function CreateSquare(size As Double) As PhysicsKit.Rectangle
		  ///
		  ' Creates a square (equal height and width Rectangle) with the given size, centered at the origin.
		  '
		  ' - Parameter size: The size in metres.
		  '
		  ' - Returns: Rectangle.
		  '
		  ' - Raises: InvalidArgumentException if size is less than or equal to zero.
		  ///
		  
		  // Check the size.
		  If size <= 0.0 Then Raise New InvalidArgumentException(Messages.GEOMETRY_INVALID_SIZE)
		  
		  Return New Rectangle(size, size)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720547269616E676C652C207573696E672074686520676976656E20706F696E74732E204D616B6573206120636F7079206F662074686520676976656E20706F696E747320746F206372656174652074686520547269616E676C652E20526169736573204E696C4F626A656374457863657074696F6E732E
		Shared Function CreateTriangle(p1 As PhysicsKit.Vector2, p2 As PhysicsKit.Vector2, p3 As PhysicsKit.Vector2) As PhysicsKit.Triangle
		  ///
		  ' Creates a new Triangle, using the given points.
		  '
		  ' This method makes a copy of the given points to create the Triangle.
		  '
		  ' The centre of the Triangle will be computed using the area weighted method.
		  '
		  ' - Parameter p1: The first point.
		  ' - Parameter p2: The second point.
		  ' - Parameter p3: The third point.
		  '
		  ' - Returns: A new Triangle.
		  '
		  ' - Raises: NiObjectException if `p1`, `p2`, or `p3` is Nil.
		  ///
		  
		  If p1 Is Nil Or p2 Is Nil Or p3 Is Nil Then
		    Raise New NilObjectException(Messages.GEOMETRY_NIL_TRIANGLE_POINT)
		  End If
		  
		  Return New Triangle(p1.Copy, p2.Copy, p3.Copy)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720547269616E676C6520776974682074686520676976656E20706F696E74732063656E746572656420617420746865206F726967696E2E204D616B6573206120636F7079206F662074686520676976656E20706F696E747320746F206372656174652074686520547269616E676C652E20526169736573204E696C4F626A656374457863657074696F6E732E
		Shared Function CreateTriangleAtOrigin(p1 As PhysicsKit.Vector2, p2 As PhysicsKit.Vector2, p3 As PhysicsKit.Vector2) As PhysicsKit.Triangle
		  ///
		  ' Creates a new Triangle with the given points centered at the origin.
		  '
		  ' This method makes a copy of the given points to create the Triangle.
		  '
		  ' - Parameter p1: The first point.
		  ' - Parameter p2: The second point.
		  ' - Parameter p3: The third point.
		  '
		  ' - Returns: A new Triangle.'
		  ' - Raises: NilObjectException if `p1`, `p2`, or `p3` is Nil.
		  ///
		  
		  Var t As Triangle = Geometry.CreateTriangle(p1, p2, p3)
		  Var center As Vector2 = t.GetCenter
		  t.Translate(-center.X, -center.Y)
		  
		  Return t
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E65772020506F6C79676F6E20776974682060636F756E7460206E756D626572206F6620706F696E74732C2077686572652074686520706F696E747320617265206576656E6C792064697374726962757465642061726F756E642074686520756E697420636972636C652E202054686520726573756C74696E6720506F6C79676F6E2077696C6C2062652063656E7465726564206F6E20746865206F726967696E2E
		Shared Function CreateUnitCirclePolygon(count As Integer, radius As Double) As PhysicsKit.Polygon
		  ///
		  ' Returns a new  Polygon with `count` number of points, where the points are 
		  ' evenly distributed around the unit circle.  The resulting Polygon will be centered on the origin.
		  '
		  ' The radius parameter is the distance from the centre of the polygon to each vertex.
		  '
		  ' - Parameter count: The number of vertices.
		  ' - Parameter radius: The radius from the centre to each vertex in meters.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: InvalidArgumentException if `count` < 3 or radius <= 0.
		  ///
		  
		  Return Geometry.CreateUnitCirclePolygon(count, radius, 0.0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206E657720506F6C79676F6E207769746820636F756E74206E756D626572206F6620706F696E74732C2077686572652074686520706F696E747320617265206576656E6C792064697374726962757465642061726F756E642074686520756E697420636972636C652E2054686520726573756C74696E6720506F6C79676F6E2077696C6C2062652063656E7465726564206F6E20746865206F726967696E2E
		Shared Function CreateUnitCirclePolygon(count As Integer, radius As Double, theta As Double) As PhysicsKit.Polygon
		  ///
		  ' Returns a new Polygon with count number of points, where the points are evenly 
		  ' distributed around the unit circle. The resulting Polygon will be centered on the origin.
		  '
		  ' The `radius` parameter is the distance from the centre of the polygon to each vertex.
		  ' The `theta` parameter is a vertex angle offset used to rotate all the vertices by the given amount.
		  '
		  ' - Parameter count: The number of vertices.
		  ' - Parameter radius: The radius from the centre to each vertex in meters.
		  ' - Parameter theta: The vertex angle offset in radians.
		  '
		  ' - Returns: A new Polygon.
		  '
		  ' - Raises: InvalidArgumentException if `count` < 3 or `radius` <= 0.
		  ///
		  
		  // Check the count.
		  If count < 3 Then Raise New InvalidArgumentException(Messages.GEOMETRY_INVALID_VERTICES_SIZE)
		  
		  // Check the radius.
		  If radius <= 0.0 Then Raise New InvalidArgumentException(Messages.GEOMETRY_INVALID_RADIUS)
		  
		  // Call the more efficient method here.
		  Return Geometry.CreatePolygonalCircle(count, radius, theta)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E6577205365676D656E7420776974682074686520676976656E206C656E6774682077697468207468652063656E74726520617420746865206F726967696E2E20606C656E6774686020697320696E206D65747265732E2052616973657320496E76616C6964417267756D656E74457863657074696F6E732E
		Shared Function CreateVerticalSegment(length As Double) As PhysicsKit.Segment
		  ///
		  ' Creates a new Segment with the given length with the centre at the origin.
		  '
		  ' - Parameter length: The length of the segment in metres.
		  '
		  ' - Returns: A new Segment.
		  '
		  ' - Raises: InvalidArgumentException if `length` is less than or equal to zero.
		  ///
		  
		  // Check the length.
		  If length <= 0.0 Then Raise New InvalidArgumentException(Messages.GEOMETRY_INVALID_LENGTH)
		  
		  Var start As Vector2 = New Vector2(0.0, -length * 0.5)
		  Var endPoint As Vector2 = New Vector2(0.0, length * 0.5)
		  
		  Return New Segment(start, endPoint)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520617265612077656967687465642063656E74726F696420666F722074686520676976656E20706F696E74732E
		Shared Function GetAreaWeightedCenter(points() As PhysicsKit.Vector2) As PhysicsKit.Vector2
		  ///
		  ' Returns the area weighted centroid for the given points.
		  '
		  ' A Polygon's centroid must be computed by the area weighted method since the
		  ' average method can be bias to one side if there are more points on that one
		  ' side than another.
		  '
		  ' - Parameter points: The Polygon points.
		  ' 
		  ' - Returns: The area weighted centroid as a Vector2.
		  '
		  ' - Raises: NilObjectException if `points` is Nil or an element of `points` is Nil.
		  ' - Raises: InvalidArgumentException if `points` is empty.
		  ///
		  
		  // Calculate the average centre.
		  // Note that this also performs the necessary checks and raises any exceptions needed.
		  Var ac As Vector2 = Geometry.GetAverageCenter(points)
		  Var size As Integer = points.Count
		  
		  // Otherwise perform the computation.
		  Var center As Vector2 = New Vector2
		  Var area As Double = 0.0
		  // Loop through the vertices.
		  Var iLimit As Integer = size - 1
		  For i As Integer = 0 To iLimit
		    // Get two vertices.
		    Var p1 As Vector2 = points(i)
		    Var p2 As Vector2 = If(i + 1 < size, points(i + 1), points(0))
		    p1 = p1.Difference(ac)
		    p2 = p2.Difference(ac)
		    // Perform the cross product (yi * x(i+1) - y(i+1) * xi)
		    Var d As Double = p1.Cross(p2)
		    // Multiply by half.
		    Var triangleArea As Double = 0.5 * d
		    // Add it to the total area.
		    area = area + triangleArea
		    
		    // Area weighted centroid
		    // (p1 + p2) * (D / 3)
		    // = (x1 + x2) * (yi * x(i+1) - y(i+1) * xi) / 3
		    // We will divide by the total area later.
		    Call center.Add(p1.Add(p2).Multiply(INV_3).Multiply(triangleArea))
		  Next i
		  
		  // Check for zero area.
		  If Abs(area) <= Epsilon.E Then
		    // Zero area can only happen if all the points are the same point 
		    // in which case just return a copy of the first.
		    Return points(0).Copy
		  End If
		  
		  // Finish the centroid calculation by dividing by the total area.
		  Call center.Divide(area).Add(ac)
		  
		  // Return the centre.
		  Return center
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652063656E74726F6964206F662074686520676976656E20706F696E747320627920706572666F726D696E6720616E20617665726167652E
		Shared Function GetAverageCenter(points() As PhysicsKit.Vector2) As PhysicsKit.Vector2
		  ///
		  ' Returns the centroid of the given points by performing an average.
		  '
		  ' - Parameter points: The list of points.
		  '
		  '- Returns: The centroid as a Vector2.
		  '
		  ' - Raises: NilObjectException if `points` is Nil or an element of `points` is Nil.
		  ' - Raises: InvalidArgumentException if `points` is an empty array.
		  ///
		  
		  // Check for Nil array
		  If points = Nil Then Raise New NilObjectException(Messages.GEOMETRY_NIL_POINT_ARRAY)
		  
		  // Check for an empty array.
		  If points.Count = 0 Then
		    Raise New InvalidArgumentException(Messages.GEOMETRY_INVALID_SIZE_POINT_ARRAY1)
		  End If
		  
		  // Get the size.
		  Var size As Integer = points.Count
		  
		  // Check for an array of one point.
		  If size = 1 Then
		    Var p As Vector2 = points(0)
		    // Make sure it's not Nil.
		    If p Is Nil Then Raise New NilObjectException(Messages.GEOMETRY_NIL_POINT_ARRAY_ELEMENTS)
		    // Return a copy.
		    Return p.Copy
		  End If
		  
		  // Otherwise perform the average.
		  Var ac As Vector2 = New Vector2
		  For Each point As Vector2 In points
		    // Check for Nil.
		    If point Is Nil Then Raise New NilObjectException(Messages.GEOMETRY_NIL_POINT_ARRAY_ELEMENTS)
		    Call ac.Add(point)
		  Next point
		  
		  Return ac.Divide(size)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320616E206172726179206F66206E6F726D616C6973656420766563746F727320726570726573656E74696E6720746865206E6F726D616C73206F6620616C6C2074686520656467657320676976656E207468652076657274696365732E
		Shared Function GetCounterClockwiseEdgeNormals(vertices() As PhysicsKit.Vector2) As PhysicsKit.Vector2()
		  ///
		  ' Returns an array of normalised vectors representing the normals of all the
		  ' edges given the vertices.
		  '
		  ' This method assumes counter-clockwise ordering.
		  '
		  ' - Parameter vertices: The vertices.
		  '
		  ' - Returns Vector2 array or Nil if the given `vertices` array is Nil or empty.
		  '
		  ' - Raises: NilObjectException if `vertices` contains a Nil element.
		  ///
		  
		  If vertices = Nil Then Return Nil
		  
		  Var size As Integer = vertices.Count
		  If size = 0 Then Return Nil
		  
		  Var normals() As Vector2
		  normals.ResizeTo(size - 1)
		  Var iLimit As Integer = size - 1
		  For i As Integer = 0 To iLimit
		    // Get the edge points.
		    Var p1 As Vector2 = vertices(i)
		    Var p2 As Vector2 = If((i + 1 = size), vertices(0), vertices(i + 1))
		    // Create the edge and get its left perpedicular vector.
		    Var n As Vector2 = p1.Towards(p2).Left
		    // Normalise it.
		    Call n.Normalise
		    normals(i) = n
		  Next i
		  
		  Return normals
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206D6178696D756D20726164697573206F662074686520676976656E20766572746963657320726F74617465642061626F757420746865206F726967696E2E20496620746865207665727469636573206172726179206973204E696C206F7220656D7074792C207A65726F2069732072657475726E65642E
		Shared Function GetRotationRadius(ParamArray vertices As PhysicsKit.Vector2) As Double
		  ///
		  ' Returns the maximum radius of the given vertices rotated about the origin.
		  '
		  ' If the vertices array is Nil or empty, zero is returned.
		  '
		  ' - Parameter vertices: The polygon vertices.
		  '
		  '- Returns: Double.
		  ///
		  
		  Return Geometry.GetRotationRadius(New Vector2, vertices)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206D6178696D756D20726164697573206F662074686520676976656E20766572746963657320726F74617465642061626F75742074686520676976656E2063656E7472652E204966207468652060766572746963657360206172726179206973204E696C206F7220656D7074792C207A65726F2069732072657475726E65642E204966206063656E74657260206973204E696C20746865206F726967696E2077696C6C206265207573656420696E73746561642E
		Shared Function GetRotationRadius(center As PhysicsKit.Vector2, vertices() As PhysicsKit.Vector2) As Double
		  ///
		  ' Returns the maximum radius of the given vertices rotated about the given center.
		  '
		  ' If the vertices array is Nil or empty, zero is returned.
		  ' If center is Nil the origin will be used instead.
		  '
		  ' - Parameter center: The center point.
		  ' - Parameter vertices: The polygon vertices.
		  '
		  ' - Returns: Double.
		  ///
		  
		  // Validate the vertices.
		  If vertices = Nil Then Return 0.0
		  
		  // Validate the centre.
		  If center = Nil Then center = New Vector2
		  
		  // Validate the length.
		  If vertices.Count = 0 Then Return 0.0
		  
		  // Find the maximum radius from the centre.
		  Var r2 As Double = 0.0
		  For Each v As Vector2 In vertices
		    // Validate each vertex.
		    If v <> Nil Then
		      Var r2t As Double = center.DistanceSquared(v)
		      // Keep the largest.
		      r2 = Max(r2, r2t)
		    End If
		  Next v
		  
		  // Set the radius.
		  Return Sqrt(r2)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652077696E64696E672C20436C6F636B77697365206F7220436F756E7465722D436C6F636B776973652C20666F722074686520676976656E206172726179206F6620706F696E7473206F66206120706F6C79676F6E2E2052657475726E73206E6567617469766520666F7220436C6F636B776973652077696E64696E673B20706F73697469766520666F7220436F756E7465722D436C6F636B776973652077696E64696E672E20526169736573204E696C4F626A656374457863657074696F6E7320616E6420496E76616C6964417267756D656E74457863657074696F6E732E
		Shared Function GetWinding(points() As PhysicsKit.Vector2) As Double
		  ///
		  ' Returns the winding, Clockwise or Counter-Clockwise, for the given array of points of a polygon.
		  '
		  ' This method determines the winding by computing a signed "area".
		  '
		  ' - Parameter points: The points of a polygon.
		  '
		  ' - Returns: Negative for Clockwise winding positive for Counter-Clockwise winding.
		  '
		  ' - Raises: NilObjectException if `points` is Nil or an element of points is Nil.
		  ' - Raises: InvalidArgumentException if `points` contains less than 2 elements
		  ///
		  
		  // Check for a Nil array.
		  If points Is Nil Then Raise New NilObjectException(Messages.GEOMETRY_NIL_POINT_ARRAY)
		  
		  // Get the size.
		  Var size As Integer = points.Count
		  
		  // the Size must be larger than 1.
		  If size < 2 then Raise New InvalidArgumentException(Messages.GEOMETRY_INVALID_SIZE_POINT_ARRAY2)
		  
		  // Determine the winding by computing a signed "area".
		  Var area As Double = 0.0
		  Var iLimit As Integer = size - 1
		  For i As Integer = 0 To iLimit
		    // Get the current point and the next point.
		    Var p1 As Vector2 = points(i)
		    Var p2 As Vector2 = points(If(i + 1 = size, 0, i + 1))
		    
		    // Check for Nil.
		    If p1 Is Nil Or p2 Is Nil Then
		      Raise New NilObjectException(Messages.GEOMETRY_NIL_POINT_ARRAY_ELEMENTS)
		    End If
		    
		    // Add the signed area.
		    area = area + p1.Cross(p2)
		  Next i
		  
		  // Return the area.
		  Return area
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526576657273657320746865206F72646572206F662074686520706F6C79676F6E20706F696E74732077697468696E2074686520676976656E2061727261792E20526169736573204E696C4F626A656374457863657074696F6E732E
		Shared Sub ReverseWinding(points() As PhysicsKit.Vector2)
		  ///
		  ' Reverses the order of the polygon points within the given array.
		  '
		  ' This method performs a simple array reverse.
		  '
		  ' - Parameter points: The polygon points.
		  '
		  ' - Raises: NilObjectException if `points` is Nil.
		  ///
		  
		  // Check for a Nil array.
		  If points Is Nil Then Raise New NilObjectException(Messages.GEOMETRY_NIL_POINT_ARRAY)
		  
		  // Get the length.
		  Var size As Integer = points.Count
		  
		  // Check the size.
		  If size <= 1 Then Return
		  
		  // Otherwise perform the swapping loop.
		  Var i As Integer = 0
		  Var j As Integer = size - 1
		  Var temp As Vector2
		  
		  While j > i
		    temp = points(j)
		    points(j) = points(i)
		    points(i) = temp
		    
		    j = j - 1
		    i = i + 1
		  Wend
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Contains static methods to perform standard geometric operations.
		
		This class can be used to create Shapes of varying types via the `Create` methods.
		While {@link Shape}s can be created using their constructors as well, the methods here can place their
		centres on the origin and also make copies of the given input to avoid reuse issues.
		
		This class also contains various helper methods for cleaning vector arrays and lists and performing
		various operations on Shapes.
		
	#tag EndNote


	#tag Constant, Name = INV_3, Type = Double, Dynamic = False, Default = \"0.3333333333333333", Scope = Public
	#tag EndConstant

	#tag Constant, Name = INV_SQRT_3, Type = Double, Dynamic = False, Default = \"0.5773502691896258", Scope = Public, Description = 5468652076616C7565206F662074686520696E7665727365206F66207468652073717561726520726F6F74206F6620333A20312F53717274283329
	#tag EndConstant

	#tag Constant, Name = TWO_PI, Type = Double, Dynamic = False, Default = \"6.2831853071800001", Scope = Public, Description = 32202A20E2888F20636F6E7374616E74
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
