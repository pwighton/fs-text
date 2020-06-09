# FreeSurfer Use Cases

Started:

- Default Stream (`recon-all`)
- Hippocampal and Amygdala Subfeild Segmentation
- BrainStem Segmentation

Still todo:

- Longitudinal
- FSFAST
- PetSurfer


## Pre-Reqs
  - Install FreeSurfer
  - Configure FreeSurfer

## Default Stream (`recon-all`)

The default stream of FreeSurfer, called `recon-all` performs several functions, including:

  - subcortical segmentation `aseg.mgz`
  - ..

More information can be found at \url{https://surfer.nmr.mgh.harvard.edu/fswiki/recon-all}

### Inputs

- T1-weighted structural
- T2-weighted structural (optional)

### Major Outputs

Only major outputs are listed here.  More information on outputs can be found at \url{https://surfer.nmr.mgh.harvard.edu/fswiki/ReconAllOutputFiles}

- `aseg.mgz`: Labels subcortical structures
- `?h.white`: 
- `?h.pial`: 
- `?h.thickness`

### Example

Example data:
```
export $DATADIR=~/data/studyforrest-data-structural
mkdir -p $DATADIR
rsync -aL psydata.ovgu.de::studyforrest/structural/sub-01 $DATADIR
```

Run; T1w only:
```
recon-all -all \
  -s sub-01
  -i $DATADIR/sub-01/anat/sub-01_T1w.nii.gz
```

with T1w+T2w:
```
recon-all -all \
  -s sub-01 \
  -i $DATADIR/sub-01/anat/sub-01_T1w.nii.gz \
  -T2 $DATADIR/sub-01/anat/sub-01_T2w.nii.gz \
  -T2pial
```

## Hippocampal Subfeild Segmentation

Buildling off of the outputs of the default stream, 
Overview goes here.

[More details](https://surfer.nmr.mgh.harvard.edu/fswiki/HippocampalSubfieldsAndNucleiOfAmygdala)

### Inputs

- Output of recon-all

### Major Outputs

In the `mri` subdirectory of the subject:
- `?h.hippoSfVolumes-T1.v21.txt`: estimated volumes of the hippocampal substructures and of the whole hippocampus.
- `?h.amygNucVolumes-T1.v21.txt`: estimated volumes of the nuclei of the amygdala and of the whole amygdala
- `?h.hippoAmygLabels-T1.v21.mgz`: segmentation volumes at subvoxel resolution (0.333 mm)
- `?h.hippoAmygLabels-T1.v21.FSvoxelSpace.mgz`: the discrete segmentation volume in the FreeSurfer voxel space (1mm isotropic).
- `?h.hippoAmygLabels-T1.v21.[hierarchy].mgz`: Segmentations at various hierarchy levels.
- `?h.hippoAmygLabels-T1.v21.[hierarchy].FSvoxelSpace.mgz`: Segmentations at various hierarchy levels, stored in FreeSurfer's voxel space

### Example

Begin by following the `recon-all` example to recon `sub-01` of studyforrest structural dataset.

Run; T1w only:
```
segmentHA_T1.sh sub-01 
```

T1w + T2w:
```
segmentHA_T2.sh sub-01 $DATADIR/sub-01/anat/sub-01_T2w.nii.gz t2 1"
```

## Brainstem Substructure Segmentation

Overview goes here.

[More details](https://surfer.nmr.mgh.harvard.edu/fswiki/BrainstemSubstructures)

### Inputs

- Output of recon-all

### Major Outputs

- ..

### Example

Begin by following the `recon-all` example to recon `sub-01` of studyforrest structural dataset.

Run:
```
segmentBS.sh sub-01 
```
