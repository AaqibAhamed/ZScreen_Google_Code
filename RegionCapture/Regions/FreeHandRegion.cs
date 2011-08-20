﻿#region License Information (GPL v2)

/*
    ZUploader - A program that allows you to upload images, texts or files
    Copyright (C) 2008-2011 ZScreen Developers

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License
    as published by the Free Software Foundation; either version 2
    of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

    Optionally you can also view the license at <http://www.gnu.org/licenses/>.
*/

#endregion License Information (GPL v2)

using System.Drawing;
using System.Drawing.Drawing2D;
using System.Windows.Forms;

namespace RegionCapture
{
    public class FreeHandRegion : Surface
    {
        private NodeObject lastNode;

        public FreeHandRegion(Image backgroundImage)
            : base(backgroundImage)
        {
            AutoCalculateArea = false;

            regionPath = new GraphicsPath();

            lastNode = new NodeObject(borderPen, nodeBackgroundBrush);
            DrawableObjects.Add(lastNode);

            MouseDown += new MouseEventHandler(FreeHandRegionSurface_MouseDown);
        }

        private void FreeHandRegionSurface_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right && lastNode.IsMouseHover)
            {
                lastNode.Visible = false;
                regionPath.Reset();
            }
        }

        protected override void Update()
        {
            base.Update();

            if (!lastNode.Visible && isMouseDown)
            {
                lastNode.Visible = true;
                lastNode.IsHolding = true;
            }

            if (lastNode.Visible && lastNode.IsHolding)
            {
                regionPath.AddLine(oldMousePosition, mousePosition);
                lastNode.Position = mousePosition;
            }

            if (regionPath.PointCount > 2)
            {
                Area = Rectangle.Round(regionPath.GetBounds());
            }
        }

        protected override void Draw(Graphics g)
        {
            if (regionPath.PointCount > 2)
            {
                Region region = new Region(regionPath);
                g.ExcludeClip(region);
                g.FillRectangle(shadowBrush, 0, 0, Width, Height);
                g.ResetClip();
                g.DrawPath(borderPen, regionPath);
                g.DrawRectangle(borderPen, Area.X, Area.Y, Area.Width - 1, Area.Height - 1);
            }
            else
            {
                g.FillRectangle(shadowBrush, 0, 0, Width, Height);
            }

            DrawObjects(g);
        }
    }
}