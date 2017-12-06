using myFinEtools

radius, nperradius = 5.0, 8
fens, fes = Q4spheren(radius, nperradius)
File =  "Sphere_mesh.vtk"
vtkexportmesh(File, fes.conn, fens.xyz, FinEtools.MeshExportModule.Q4);
@async run(`"paraview.exe" $File`)