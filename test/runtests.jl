using SimpleCrystals
using Test
using LinearAlgebra

# These tests are only designed to ensure that the constructors for
# the crystals work. It does not check that the coordinates
# generated are correct.

@testset "3D-Monoatomic" begin
    a = 0.54u"nm"
    sc_crystal = SC(0.54u"nm", :C)
    atoms_sc = replicate_unit_cell(sc_crystal, SVector(4,4,4))

    fcc_crystal = FCC(0.54u"nm", :C)
    atoms_fcc = replicate_unit_cell(fcc_crystal, SVector(4,4,4))

    @test length(atoms_sc) == 64
    @test norm(ustrip.(atoms_sc[1].position) .- ustrip.(atoms_sc[2].position)) == ustrip(a)

    @test length(atoms_fcc) == 256
    @test norm(ustrip.(atoms_fcc[1].position) .- ustrip.(atoms_fcc[2].position)) ≈ ustrip(a)/sqrt(2)
end

@testset "2D-Monoatomic" begin
    
    hex_crystal = Honeycomb(0.54u"nm",:C)
    atoms = replicate_unit_cell(hex_crystal, SVector(4,4))

    @test length(atoms) == 32

end


