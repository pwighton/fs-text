# FreeSurfer Use Cases

## Pre-Reqs
  - Install FreeSurfer
  - Configure FreeSurfer

## Subject Level Use Cases

### `recon-all`

Overview goes here.

[More details](https://surfer.nmr.mgh.harvard.edu/fswiki/recon-all)

#### Inputs

- T1-weighted structural
- T2-weighted structural (optional)

#### Major Outputs

- `aseg.mgz`
- ...

#### Example

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

### Hippocampal Subfeild Segmentation

Overview goes here.

[More details](https://surfer.nmr.mgh.harvard.edu/fswiki/HippocampalSubfieldsAndNucleiOfAmygdala)

#### Inputs

- Output of recon-all

#### Major Outputs

- ..

#### Example

- Follow along with `recon-all` example to recon `sub-01` of studyforrest structural dataset

Run; T1w only
```
segmentHA_T1.sh sub-01 
```

T1w + T2w
```
segmentHA_T2.sh sub-01 $DATADIR/sub-01/anat/sub-01_T2w.nii.gz t2 1"
```
sub-01_T1w.nii.gz
cmd1=""
cmd2="segmentBS.sh sub-01"
cmd4="asegstats2table --subjects sub-01 --segno 11 17 18 --meas mean --tablefile aseg.mean-intensity.table"
cmd5="aparcstats2table --hemi lh --subjects sub-01 --tablefile lh.aparc.area.table"

### 
